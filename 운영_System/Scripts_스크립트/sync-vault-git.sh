#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: bash 운영_System/Scripts_스크립트/sync-vault-git.sh [--dry-run|--pull|--commit|--push]

Modes:
  --dry-run   Show repo status and safety checks only. Default.
  --pull      Pull/rebase from origin for current branch only.
  --commit    Stage and commit local changes only. Does not push.
  --push      Pull/rebase, stage, commit if needed, then push.

Safety:
  - Refuses to run outside a git repo.
  - Refuses push/pull when origin is missing.
  - Verifies known private/cache paths are ignored.
  - Refuses if secret/cache paths are already tracked.
  - Refuses photos/media and likely-sensitive folders in staged commits.
  - Refuses push to a public GitHub repository unless ALLOW_PUBLIC_VAULT_PUSH=1.
USAGE
}

MODE="${1:---dry-run}"
case "$MODE" in
  --dry-run|--pull|--commit|--push) ;;
  -h|--help) usage; exit 0 ;;
  *) echo "Unknown mode: $MODE" >&2; usage; exit 2 ;;
esac

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VAULT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$VAULT_ROOT"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "ERROR: Not inside a git repository: $VAULT_ROOT" >&2
  exit 10
fi

BRANCH="$(git branch --show-current)"
if [[ -z "$BRANCH" ]]; then
  echo "ERROR: Detached HEAD. Stop and inspect manually." >&2
  exit 11
fi

REMOTE_URL="$(git remote get-url origin 2>/dev/null || true)"

check_ignored() {
  local path="$1"
  if ! git check-ignore -q "$path"; then
    echo "ERROR: expected ignored path is not ignored: $path" >&2
    exit 20
  fi
}

check_not_tracked() {
  local path="$1"
  if git ls-files --error-unmatch "$path" >/dev/null 2>&1; then
    echo "ERROR: private/cache path is already tracked: $path" >&2
    exit 21
  fi
}

remote_github_slug() {
  local url="$1"
  python3 - "$url" <<'PY'
import re, sys
url = sys.argv[1]
patterns = [
    r'github\.com[:/]([^/]+)/([^/]+?)(?:\.git)?$',
]
for pat in patterns:
    m = re.search(pat, url)
    if m:
        print(m.group(1) + '/' + m.group(2))
        sys.exit(0)
sys.exit(1)
PY
}

refuse_public_github_push_unless_allowed() {
  if [[ "${ALLOW_PUBLIC_VAULT_PUSH:-}" == "1" ]]; then
    return 0
  fi
  local slug
  slug="$(remote_github_slug "$REMOTE_URL" 2>/dev/null || true)"
  if [[ -z "$slug" ]]; then
    return 0
  fi
  local visibility
  visibility="$(python3 - "$slug" <<'PY'
import json, sys, urllib.request, urllib.error
slug = sys.argv[1]
try:
    with urllib.request.urlopen(f'https://api.github.com/repos/{slug}', timeout=10) as r:
        data = json.load(r)
        print('private' if data.get('private') else 'public')
except Exception:
    print('unknown')
PY
)"
  if [[ "$visibility" == "public" ]]; then
    echo "ERROR: origin GitHub repository is public: $slug" >&2
    echo "Refusing to push an Obsidian vault publicly. Make the repo private or rerun with ALLOW_PUBLIC_VAULT_PUSH=1 after explicit approval." >&2
    exit 31
  fi
}

refuse_tracked_or_staged_sensitive_paths() {
  local mode="$1"
  python3 - "$mode" <<'PY'
import subprocess, sys
mode = sys.argv[1]
if mode == 'tracked':
    cmd = ['git', '-c', 'core.quotepath=false', 'ls-files']
else:
    cmd = ['git', '-c', 'core.quotepath=false', 'diff', '--cached', '--name-only', '--diff-filter=ACMR']
files = subprocess.run(cmd, text=True, capture_output=True, check=True).stdout.splitlines()
media_ext = ('.png','.jpg','.jpeg','.gif','.webp','.svg','.bmp','.tiff','.jfif','.heic','.avif')
blocked_prefixes = (
    'Obsidian/Image/', '수집_Inbox/', 'Note/Pop-up/', 'Study/Computer/',
    '운영_System/Reports_리포트/', '운영_System/서재_Library/', '.smart-env/', 'copilot/', '.trash/'
)
blocked_substrings = ('Token Budget Audit', 'token budget', 'Portfolio', 'Bug Bounty', 'Hacking')
bad = []
for f in files:
    low = f.lower()
    if low.endswith(media_ext) or any(f.startswith(p) for p in blocked_prefixes) or any(s.lower() in low for s in blocked_substrings):
        bad.append(f)
if bad:
    print(f'ERROR: {mode} paths include photos/media or likely-sensitive paths:', file=sys.stderr)
    for f in bad[:80]:
        print('  ' + f, file=sys.stderr)
    if len(bad) > 80:
        print(f'  ... and {len(bad)-80} more', file=sys.stderr)
    sys.exit(41 if mode == 'tracked' else 42)
PY
}

# Known private/cache paths. Keep this list conservative and explicit.
check_ignored ".obsidian/plugins/copilot/data.json"
check_ignored ".smart-env"
check_ignored "copilot"
check_ignored "운영_System/Reports_리포트/.openai-token-budget-audit-state.json"

check_not_tracked ".obsidian/plugins/copilot/data.json"
check_not_tracked ".smart-env"
check_not_tracked "운영_System/Reports_리포트/.openai-token-budget-audit-state.json"

if [[ "$MODE" == "--dry-run" ]]; then
  echo "Vault root: $VAULT_ROOT"
  echo "Branch: $BRANCH"
  echo "Origin: ${REMOTE_URL:-<missing>}"
  echo
  echo "Status:"
  git status --short
  echo
  echo "Safety checks: OK"
  exit 0
fi

if [[ "$MODE" == "--pull" || "$MODE" == "--push" ]]; then
  if [[ -z "$REMOTE_URL" ]]; then
    echo "ERROR: origin remote is missing. Add GitHub private repo remote first." >&2
    exit 30
  fi
  if [[ "$MODE" == "--push" ]]; then
    refuse_public_github_push_unless_allowed
  fi
  if git ls-remote --exit-code --heads origin "$BRANCH" >/dev/null 2>&1; then
    git pull --rebase --autostash origin "$BRANCH"
  else
    echo "No remote branch origin/$BRANCH yet; skipping pull for first push."
  fi
fi

if [[ "$MODE" == "--commit" || "$MODE" == "--push" ]]; then
  git add -A

  # Refuse broad staged deletion.
  DELETIONS="$(git diff --cached --name-status | awk '$1 ~ /^D/ {count++} END {print count+0}')"
  if [[ "$DELETIONS" -ge 100 ]]; then
    echo "ERROR: $DELETIONS staged deletions. Stop and inspect manually." >&2
    exit 40
  fi

  refuse_tracked_or_staged_sensitive_paths staged

  if git diff --cached --quiet; then
    echo "No staged changes to commit."
  else
    MSG="Vault sync: $(date '+%Y-%m-%d %H:%M:%S %z')"
    git commit -m "$MSG"
  fi
fi

if [[ "$MODE" == "--push" ]]; then
  git push origin "$BRANCH"
fi

echo "Done: $MODE"
