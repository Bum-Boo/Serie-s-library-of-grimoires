---
type: system-note
status: active
created: 2026-06-06
updated: 2026-06-11
snapshot_scope: one-time
snapshot_note: "2026-06-06 기준 1회성 스냅샷. 최신 상태 리포트가 아님."
tags:
  - system
  - obsidian
  - vault-health
  - ai-agent
summary: Serie's Library of Grimoires vault 안전 자동화 점검 리포트.
related:
  - "[[운영_System/Vault Guide]]"
  - "[[운영_System/AI Agent Work Log]]"
---
# Serie's Library of Grimoires Vault Health Report - 2026-06-06

> [!warning] 1회성 스냅샷
> 이 리포트는 2026-06-06 기준 점검 결과다. 2026-06-11 현재 최신 vault 상태를 대표하지 않는다. Weekly Obsidian Hygiene Report가 정식 승격되기 전까지 참고용 기록으로만 사용한다.

## 요약

- Vault: `/mnt/c/Users/Hojun/Documents/Obsidians/Serie's Library of Grimoires`
- 검증 실행: `powershell.exe -NoProfile -ExecutionPolicy Bypass -File ...validate-vault.ps1`
- 검증 exit code: `0`
- Markdown 수: 57
- 파일 수(heavy hidden 제외): 164
- Dataview query 수: 7
- Git branch: `codex/vault-maintenance`
- Git untracked/changed line 수: 17

## Validation Output

```text
Vault root: C:\Users\Hojun\Documents\Obsidians\Serie's Library of Grimoires
Markdown files scanned: 42
Files scanned: 59
Folder skeleton: OK
Markdown frontmatter: OK
Required metadata: OK
Type vocabulary: OK
Status vocabulary: OK
Wikilinks: OK
Potentially unreferenced attachments:
  - Obsidian/Image/ed01fb6f-f164-40d8-9fbd-57546479b585.png
  - Obsidian/Image/Pasted image 20260219061950.png
  - Obsidian/Image/TA-2026-02-12-13-14-02-Astrikings-16513672.png
  - Obsidian/Image/TA-2026-02-12-15-24-42-Asurrealan-3012914749-1 1.png
  - Obsidian/Image/TA-2026-02-12-15-24-42-Asurrealan-3012914749-1.png
  - Pasted image 20251230072536.png
  - Pasted image 20260116073845.png
  - Pasted image 20260116073913.png
Empty folders: 61 (expected while the vault structure is being staged)
Validation result: OK
```

## Markdown 분포

- `Study`: 19
- `copilot`: 15
- `운영_System`: 14
- `Obsidian`: 5
- `Note`: 2
- `Play`: 2

## Frontmatter 누락 후보

- `Obsidian/Dashboard.md`
- `운영_System/AI Agent Work Log.md`
- `운영_System/Index.md`
- `운영_System/Vault Guide.md`
- `운영_System/Bases_대시보드/Vault Dashboard.md`
- `운영_System/Scripts_스크립트/README.md`

## 잠재 미참조 이미지 후보

삭제/이동 금지. 수동 확인 전에는 감사 목록으로만 유지한다.

- `Obsidian/Image/ed01fb6f-f164-40d8-9fbd-57546479b585.png` — filename refs: 0, modified: 2026-02-18 07:19:19
- `Obsidian/Image/Pasted image 20260219061950.png` — filename refs: 0, modified: 2026-02-19 06:19:50
- `Obsidian/Image/TA-2026-02-12-13-14-02-Astrikings-16513672.png` — filename refs: 0, modified: 2026-02-18 07:20:53
- `Obsidian/Image/TA-2026-02-12-15-24-42-Asurrealan-3012914749-1 1.png` — filename refs: 0, modified: 2026-02-18 07:13:00
- `Obsidian/Image/TA-2026-02-12-15-24-42-Asurrealan-3012914749-1.png` — filename refs: 0, modified: 2026-02-18 07:12:52
- `Pasted image 20251230072536.png` — filename refs: 0, modified: 2025-12-30 07:25:36
- `Pasted image 20260116073845.png` — filename refs: 0, modified: 2026-01-16 07:38:45
- `Pasted image 20260116073913.png` — filename refs: 0, modified: 2026-01-16 07:39:13

## Git 상태 요약

```text
?? .gitignore
?? .obsidian/
?? Note/
?? Obsidian/
?? "Pasted image 20251230072536.png"
?? "Pasted image 20260101165404.png"
?? "Pasted image 20260116073845.png"
?? "Pasted image 20260116073913.png"
?? "Pasted image 20260116075748.png"
?? "Pasted image 20260116075828.png"
?? "Pasted image 20260121072742.png"
?? "Pasted image 20260205004319.png"
?? "Pasted image 20260206012601.png"
?? Play/
?? Study/
?? copilot/
?? "\354\232\264\354\230\201_System/"
```

## 자동화 판정

- P0 가능: Vault 건강검진 리포트 자동 생성
- P0 가능: 미참조 이미지 감사 목록 생성
- P1 가능: Frontmatter 누락 점검표 생성
- P1 가능: Dashboard/Dataview 쿼리 점검
- 보류: 삭제, 이동, 대량 리네임, 자동 태깅

## 다음 제리에 작업

- 매일 23:59 KST에 조사목록을 수집/분류해서 Obsidian에 저장한다.
- 원본 기억과 조사목록은 읽기 전용으로 다룬다.
- 저장 위치는 `수집_Inbox/조사목록_ResearchQueue/` 아래 일자별 노트로 둔다.
