---
type: system-note
status: active
created: 2026-06-04
updated: 2026-06-20
project: obsidian-automation
area:
topics:
  - ai-agent
  - vault-maintenance
tags:
  - system
  - ai-agent
  - maintenance-log
summary: AI agents should read this file before vault maintenance work and append a dated log entry after making changes.
related:
  - "[[운영_System/Vault Guide]]"
  - "[[운영_System/Scripts_스크립트/validate-vault.ps1]]"
  - "[[운영_System/Bases_대시보드/Vault Dashboard]]"
---
# AI Agent Work Log

## Purpose

This file is the shared maintenance report for AI agents working on this Obsidian vault.

Read this before making structural, metadata, template, script, or Obsidian setting changes. After completing work, append a dated entry under `Work History` with the change summary, validation result, and any remaining risks.

<!-- AI AGENT INSTRUCTION: If you modify this vault in a later session, append your work log under "Work History" before finishing. Include date, changed files or areas, validation command/result, and unresolved issues. Do not delete prior entries. -->

## Current Vault State

- Report date: 2026-06-04
- Vault root: `C:\Users\Hojun\Documents\Obsidians\Serie's Library of Grimoires`
- Primary system folder: `운영_System`
- Capture folder: `수집_Inbox`
- Periodic notes folder: `루틴_Periodic`
- Active project folder: `프로젝트_Projects`
- Knowledge/source/output folders: `지식_Knowledge`, `자료_Sources`, `결과물_Outputs`
- Archive folder: `보관_Archive`

## Agent Operating Rules

- Preserve user-authored note content unless the user explicitly asks for content rewriting.
- Prefer adding metadata, summaries, links, and system notes over moving or deleting source material.
- Use `운영_System/Templates_템플릿` for vault templates.
- Use `수집_Inbox` for new uncategorized notes.
- Use `루틴_Periodic/Daily_일일` for daily notes.
- Run the validation script after structural or metadata changes:

```powershell
.\운영_System\Scripts_스크립트\validate-vault.ps1
```

- Use strict mode only when a non-zero exit code is needed:

```powershell
.\운영_System\Scripts_스크립트\validate-vault.ps1 -Strict
```

## Known Follow-Ups

- Review potentially unreferenced image attachments before deleting or moving them.
- Empty staged folders are expected while the vault structure is being adopted.
- The repository is still before its first baseline commit, so many files may appear as untracked.

## Work History

### 2026-06-04 - Vault Maintenance Alignment

Agent: Codex

Changes:

- Aligned Obsidian settings with the new vault structure.
- Set new file location to `수집_Inbox`.
- Set template folder to `운영_System/Templates_템플릿`.
- Set Daily Notes folder/template to `루틴_Periodic/Daily_일일` and `운영_System/Templates_템플릿/06 Daily Note`.
- Set Homepage plugin target to `운영_System/Bases_대시보드/Vault Dashboard`.
- Added `운영_System/Templates_템플릿/06 Daily Note.md`.
- Added minimum frontmatter to legacy `Study`, `Note`, `Play`, and `Obsidian` Markdown notes.
- Standardized AI image note metadata.
- Expanded `운영_System/Scripts_스크립트/validate-vault.ps1` to check folder structure, frontmatter, required metadata, type/status vocabulary, broken wikilinks, and potentially unreferenced attachments.
- Updated taxonomy, dashboard, and Git ignore rules for the new maintenance flow.

Validation:

```powershell
.\운영_System\Scripts_스크립트\validate-vault.ps1
```

Result:

- Folder skeleton: OK
- Markdown frontmatter: OK
- Required metadata: OK
- Type vocabulary: OK
- Status vocabulary: OK
- Wikilinks: OK
- Validation result: OK

Remaining notes:

- The script reports potentially unreferenced image attachments. These should be reviewed manually before any deletion.
- Empty folders are expected because the target vault structure is staged for future use.

### 2026-06-04 - AI Plugin Execution Check

Agent: Codex

Scope:

- Checked installed and enabled AI-related Obsidian plugins.
- Reviewed plugin manifests, activation list, plugin data files, Obsidian app log, Smart Connections runtime files, and local Ollama availability.
- Ran Node-based bundle load tests with Obsidian API stubs to estimate how far each plugin can initialize outside the real Obsidian runtime.
- Updated `운영_System/Scripts_스크립트/validate-vault.ps1` to ignore plugin-managed runtime paths: `.smart-env` and `copilot/copilot-custom-prompts`.

Findings:

- `copilot` is installed and enabled. `main.js` exists and loads under a stubbed Obsidian runtime. It reaches instantiation, then stops during `onload` in the test harness because the fake Obsidian API is incomplete. In the real vault it has created `copilot/copilot-custom-prompts`, so it has initialized inside Obsidian at least once.
- `smart-connections` is installed and enabled. `main.js` exists and loads under a stubbed Obsidian runtime. It reaches instantiation, then stops during `onload` in the test harness because the fake Obsidian app/plugin registry is incomplete. In the real vault it has created `.smart-env` files, imported sources, and completed at least one embedding pass.
- `vaultwright-chat-review` is installed but not enabled in `.obsidian/community-plugins.json`. Its bundle loads, instantiates, and completes `onload` in the stubbed runtime. It has no `data.json` yet because it has not been activated/configured in the real vault.
- Obsidian desktop is running on app package `1.12.7`, which satisfies all three AI plugin `minAppVersion` requirements.
- Local Ollama is available at `http://localhost:11434` and has models including `qwen3:4b`, `qwen3:8b`, `gemma3:4b`, `qwen3-embedding:0.6b`, and `qwen3-embedding:4b`.

Configuration notes:

- Copilot has no API keys stored in `data.json`; it is configured for Obsidian Keychain storage.
- Copilot default model is `google/gemini-2.5-flash|openrouterai`; embedding model is `openai/text-embedding-3-small|openrouterai`.
- Copilot autonomous agent is enabled with tools including local search, read note, web search, write/edit file, and memory update.
- Smart Connections has runtime index data under `.smart-env`; `.smart-env` is ignored by Git.
- Copilot custom prompt files under `copilot/copilot-custom-prompts` are currently untracked and should be intentionally kept or ignored later.
- Copilot custom prompt files use Copilot-specific frontmatter, so the vault validation script intentionally excludes that plugin-managed folder from standard metadata checks.

Validation:

```powershell
.\운영_System\Scripts_스크립트\validate-vault.ps1
```

Result:

- Folder skeleton: OK
- Markdown frontmatter: OK
- Required metadata: OK
- Type vocabulary: OK
- Status vocabulary: OK
- Wikilinks: OK
- Validation result: OK

Remaining notes:

- To fully test Copilot chat, verify that the required Keychain/OpenRouter or other provider credentials are present inside Obsidian.
- To fully test Smart Connections chat, confirm the selected chat backend/model in the plugin UI. Local Ollama is running, but Smart Connections currently records mixed Ollama/OpenRouter settings.
- Enable `vaultwright-chat-review` only if its OpenAI API key/settings flow is intended for this vault.

### 2026-06-04 - Intuitive Folder Rename

Agent: Codex

Status: Superseded by `2026-06-04 - Numberless Folder Names And Icons`.

Scope:

- This was an intermediate folder rename pass and has been superseded.
- The current rule is documented in `2026-06-04 - Numberless Folder Names And Icons`.

Naming rule:

- Superseded. Do not follow this older section for current folder naming.

Examples:

- `운영_System`
- `수집_Inbox`
- `루틴_Periodic`
- `프로젝트_Projects`
- `지식_Knowledge`

Validation:

```powershell
.\운영_System\Scripts_스크립트\validate-vault.ps1
```

Result:

- Folder skeleton: OK
- Markdown frontmatter: OK
- Required metadata: OK
- Type vocabulary: OK
- Status vocabulary: OK
- Wikilinks: OK
- Validation result: OK

Remaining notes:

- Potentially unreferenced image attachments still need manual review before deletion or movement.
- Empty staged folders remain expected.

### 2026-06-04 - Numberless Folder Names And Icons

Agent: Codex

Scope:

- Removed numeric prefixes from the operating folders.
- Kept the `한국어_English` naming pattern for readability and compatibility.
- Updated Obsidian settings, homepage target, daily note settings, Dataview dashboard paths, system index links, vault guide paths, and validation script folder expectations.
- Added Iconize folder icon mappings in `.obsidian/plugins/obsidian-icon-folder/data.json`.
- Updated `.gitignore` so Iconize's `data.json` can be tracked as vault UI configuration.

Naming rule:

- Do not use numeric folder prefixes for the main operating folders.
- Use `한국어_English` names.
- Use Iconize icons for fast scanning and grouping.

Main folders:

- `운영_System`
- `수집_Inbox`
- `루틴_Periodic`
- `프로젝트_Projects`
- `영역_Areas`
- `지식_Knowledge`
- `자료_Sources`
- `결과물_Outputs`
- `보관_Archive`

Icon configuration:

- Plugin: Iconize (`obsidian-icon-folder`)
- Config file: `.obsidian/plugins/obsidian-icon-folder/data.json`
- Existing legacy icons for `Study`, `Play`, `Note`, and `Obsidian` were preserved.

Validation:

```powershell
.\운영_System\Scripts_스크립트\validate-vault.ps1
```

Result:

- Folder skeleton: OK
- Markdown frontmatter: OK
- Required metadata: OK
- Type vocabulary: OK
- Status vocabulary: OK
- Wikilinks: OK
- Validation result: OK

Remaining notes:

- If Obsidian is already open, Iconize may need a plugin reload or Obsidian restart before every folder icon visually refreshes.
- Potentially unreferenced image attachments still need manual review before deletion or movement.

### 2026-06-04 - Iconize Emoji Fallback

Agent: Codex

Scope:

- Investigated why folder icons were not visible after the numberless folder rename.
- Confirmed Iconize (`obsidian-icon-folder`) is enabled and its `data.json` parses successfully.
- Replaced Lucide icon-name mappings in `.obsidian/plugins/obsidian-icon-folder/data.json` with native emoji icon mappings.
- Kept exact folder-path keys so Iconize can still apply icons directly to the file explorer folders.

Reason:

- Native emoji icons do not depend on Lucide icon-pack resolution, so they are the most reliable fallback when configured Lucide IDs do not render visibly.

Validation:

```powershell
node -e "const fs=require('fs'); JSON.parse(fs.readFileSync('.\\.obsidian\\plugins\\obsidian-icon-folder\\data.json','utf8')); console.log('JSON OK')"
node -e "const fs=require('fs'), path=require('path'); const j=JSON.parse(fs.readFileSync('.\\.obsidian\\plugins\\obsidian-icon-folder\\data.json','utf8')); const miss=[]; for (const k of Object.keys(j).filter(k=>k!=='settings')) { if (!fs.existsSync(path.join(process.cwd(), k))) miss.push(k); } if (miss.length) { console.log(miss.join('\n')); process.exit(1); } console.log('Icon targets OK')"
.\운영_System\Scripts_스크립트\validate-vault.ps1
```

Result:

- Iconize JSON: OK
- Icon target paths: OK, 54 entries
- Folder skeleton: OK
- Markdown frontmatter: OK
- Required metadata: OK
- Type vocabulary: OK
- Status vocabulary: OK
- Wikilinks: OK
- Validation result: OK

Remaining notes:

- If icons still do not appear immediately, reload Iconize or restart Obsidian so the plugin reloads `.obsidian/plugins/obsidian-icon-folder/data.json`.
- If icons still fail after restart, inspect active theme/CSS snippets and Iconize file explorer settings before changing folder names again.

### 2026-06-04 - Restore Simple Iconize Icons

Agent: Codex

Scope:

- Reverted the folder icon style from native emoji icons back to the simpler Iconize/Lucide icon IDs.
- Restored `.obsidian/plugins/obsidian-icon-folder/data.json` to use `Li...` icon names such as `LiSettings`, `LiInbox`, `LiCalendarDays`, `LiFolderKanban`, and `LiBrain`.
- Restored Vertical Tabs settings touched during icon troubleshooting: `hideSidebars: true`, `backgroundMode: false`, and `disableOnThisDevice: false`.
- Restored the left workspace group so Vertical Tabs remains in the same tab group as Files/Search/Bookmarks with `currentTab: 3`.

Reason:

- The user preferred the previous minimal Iconize plugin look and found the emoji fallback too playful.

Validation:

```powershell
node -e "const fs=require('fs'), path=require('path'); const j=JSON.parse(fs.readFileSync('.\\.obsidian\\plugins\\obsidian-icon-folder\\data.json','utf8')); const entries=Object.entries(j).filter(([k])=>k!=='settings'); const miss=entries.filter(([k])=>!fs.existsSync(path.join(process.cwd(),k))).map(([k])=>k); console.log('Icon entries:', entries.length); console.log('Missing targets:', miss.length); if (miss.length) process.exit(1);"
.\운영_System\Scripts_스크립트\validate-vault.ps1
```

Result:

- Iconize JSON: OK
- Icon target paths: OK, 54 entries
- Vertical Tabs settings: restored
- Folder skeleton: OK
- Markdown frontmatter: OK
- Required metadata: OK
- Type vocabulary: OK
- Status vocabulary: OK
- Wikilinks: OK
- Validation result: OK

### 2026-06-07 - Hermes Profile Library Session Setup

Agent: 프리렌

Scope:

- Created `운영_System/서재_Library/서재 세션 - Hermes 프로필 서재 동기화.md`.
- Documented the separation between Hermes long-term memory and profile-local file libraries.
- Registered the currently confirmed Friren library path and index.
- Wrote a handoff section for 제리에 to own periodic reflection of profile libraries into the Serie's Library of Grimoires vault.

Validation:

```powershell
.\운영_System\Scripts_스크립트\validate-vault.ps1
```

Result:

- Folder skeleton: OK
- Markdown frontmatter: OK
- Required metadata: OK
- Type vocabulary: OK
- Status vocabulary: OK
- Wikilinks: OK
- Validation result: OK
- Existing potentially unreferenced attachments were reported for manual review; no attachment changes were made.

Remaining notes:

- 제리에 should own the recurring synchronization design and any future cron job.
- Automation should prefer deterministic no-agent scripts and must not read secrets, auth files, `.env`, session databases, browser profiles, or customer-sensitive data.

### 2026-06-07 - Hermes Profile Library No-Agent Cron

Agent: 프리렌

Scope:

- Added 제리에-owned deterministic script `sync_profile_libraries_to_link.py` under the `memory` profile scripts directory.
- Created reflected Serie's Library of Grimoires notes under `운영_System/서재_Library/프로필별/` and generated `운영_System/서재_Library/서재 색인.md`.
- Registered cron job `c6e339872f53` named `제리에 Series Library of Grimoires 서재 동기화` on schedule `20 4 * * *`.
- Verified the job is `no-agent`, `deliver: local`, `profile: memory`, and uses no LLM.
- Triggered a manual cron tick and confirmed last run status `ok`.

Validation:

```powershell
.\운영_System\Scripts_스크립트\validate-vault.ps1
```

Result:

- Folder skeleton: OK
- Markdown frontmatter: OK
- Required metadata: OK
- Type vocabulary: OK
- Status vocabulary: OK
- Wikilinks: OK
- Validation result: OK
- Existing potentially unreferenced attachments were reported for manual review; no attachment changes were made.

Remaining notes:

- The sync script only reads profile `library/index.jsonl` and `library/entries/**/*.md` paths.
- It writes only inside `운영_System/서재_Library/`.
- It does not delete, move, rename, access secrets/auth/session stores, or perform Git operations.

### 2026-06-11 - User Dashboard Rename and Automation Recovery

Agent: 제리에

Scope:

- Renamed root dashboard note from `내 대시보드.md` to `User Dashboard.md`.
- Updated legacy dashboard and Homepage plugin target to `User Dashboard`.
- Made `.obsidian/snippets/Cards.css` and `.obsidian/snippets/PersonalDashboard.css` eligible for Git tracking by adjusting `.gitignore`.
- Fixed `fern_local_library_supervisor.py` so local Ollama delays fall back within the cron time budget instead of timing out the no-agent job.
- Ran the deterministic profile library sync, Grimoire Kanban, OpenAI Token Budget Audit, and nightly research queue scripts manually for verification.
- Marked the 2026-06-06 Vault Health Report as a one-time snapshot.
- Added the 2026-06-23 review condition to OpenAI Token Budget Audit.
- Confirmed WSL `/mnt/c/...` and Windows `C:\\Users\\...` path forms point to the same Serie's Library of Grimoires vault.
- Checked AI Agent Work Log size: 399 lines / 15,585 bytes before this entry; no split required yet.

Validation:

```bash
python3 /home/hojun/hermes-lab/.hermes/profiles/memory/scripts/fern_local_library_supervisor.py --force
python3 /home/hojun/hermes-lab/.hermes/profiles/memory/scripts/sync_profile_libraries_to_link.py
python3 /home/hojun/hermes-lab/.hermes/profiles/memory/scripts/obsidian_grimoire_kanban.py
python3 /home/hojun/hermes-lab/.hermes/profiles/memory/scripts/openai_token_budget_audit.py
python3 /home/hojun/hermes-lab/.hermes/profiles/memory/scripts/nightly_research_queue.py
```

Result:

- Fern supervisor no longer timed out; it wrote a deterministic fallback brief because Ollama tag/model lookup did not respond in time.
- Profile library sync completed with `libraries=27 reflected=8 created=0 updated=2 skipped=44 missing=0`.
- Grimoire Kanban and Operating Charter were updated by their script.
- OpenAI Token Budget Audit was updated.
- Nightly research queue wrote the 2026-06-11 classification note.

Remaining notes:

- Do not split `AI Agent Work Log.md` until it becomes materially hard to navigate or 힘멜 approves an archive split.
- Local Ollama responsiveness still needs separate operational attention; the archive automation now degrades safely instead of failing.

### 2026-06-20 - SOUL 기반 대도서관 접수 규칙 정비

Agent: 제리에 / `serie`

Scope:

- 힘멜 승인 후 최신 profile SOUL 항목을 근거로 대도서관 개선점을 실제 vault와 profile library에 반영했다.
- 제리에 정본 profile을 `serie`로 명시하고, 오래된 `memory` 표기는 레거시 별칭으로 정리했다.
- `운영_System/서재_Library/대도서관 접수 규칙 - SOUL 반영.md`를 새로 만들었다.
- `운영_System/서재_Library/Hermes 친구 프로필-관리 폴더 지도.md`에 `serie`, `veda`, `falsch`, `eisen`, `heiter` 등 최신 profile 반영을 보강했다.
- `프로젝트_Projects/graduate-school_대학원.md`를 빈 문패에서 대학원 지식 운영 색인으로 확장했다.
- `운영_System/서재_Library/서재 색인.md`에 새 접수 규칙 링크를 연결했다.

Validation:

- Vault validation script ran after edits.
- Result: validation completed with existing vault warnings/issues; no broken wikilinks were introduced in the files changed by this work.
- Manual modified-file check: new 접수 규칙, 프로필 지도, 서재 색인, 대학원 프로젝트 note wikilinks resolved.

Remaining notes:

- 기존 vault 안의 `User Dashboard.md.bak-codex-twemoji-20260612-024642`는 운영 규칙상 vault 밖 이동 후보지만, 이번 작업에서는 삭제·이동하지 않았다.
- 현재 vault에는 이 작업 이전부터 존재하던 수정·미추적 파일들이 있어, 이번 보존 봉인은 승인된 대도서관 관련 파일만 선별 stage/push한다.
