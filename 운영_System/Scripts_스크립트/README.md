---
type: system-note
status: active
created: 2026-06-04
updated: 2026-06-04
tags:
  - system
  - scripts
---
# Scripts

Scripts in this folder should be safe by default.

- Prefer read-only validation and reporting.
- Do not modify notes unless the script name and documentation explicitly say it edits files.
- Run scripts from the vault root when possible.

## Available Scripts

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\운영_System\Scripts_스크립트\validate-vault.ps1
```

Use `-Strict` when you want the script to return a non-zero exit code for CI-style checks.

### GitHub vault sync helper

Default mode is safe audit only:

```bash
bash 운영_System/Scripts_스크립트/sync-vault-git.sh --dry-run
```

After a private GitHub `origin` remote is configured, use explicit modes:

```bash
bash 운영_System/Scripts_스크립트/sync-vault-git.sh --pull
bash 운영_System/Scripts_스크립트/sync-vault-git.sh --commit
bash 운영_System/Scripts_스크립트/sync-vault-git.sh --push
```

The sync helper refuses missing remote push/pull, known private/cache paths, broad staged deletion, and public GitHub push unless explicitly overridden.
