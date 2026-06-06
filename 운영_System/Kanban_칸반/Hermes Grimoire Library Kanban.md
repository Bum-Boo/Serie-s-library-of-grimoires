---
type: kanban-board
status: active
created: 2026-06-07
updated: 2026-06-07
owner_profile: memory
owner_name: 제리에
vault: Serie's Library of Grimoires
tags:
  - system
  - hermes
  - kanban
  - obsidian
  - automation
summary: 거대한 마법 서적 도서관 운영을 위한 Hermes 프로필별 자동화 Kanban.
related:
  - "[[운영_System/Plans_기획/Hermes Grimoire Library Operating Charter]]"
  - "[[운영_System/Hermes Profile Automation Board]]"
---
# Hermes Grimoire Library Kanban

갱신: `2026-06-07T08:08:35+0900`

## 상태 확인

- Serie's Library of Grimoires vault: 있음
- Kanban config: 있음
- Profile automation board: 있음
- AI automation status report: 있음
- Ollama HTTP: `ok`
- 모델 일부: qwen3:30b-korean-final, qwen3:8b-korean-final, qwen3:30b, granite3-dense:8b, phi4-mini:latest, bge-m3:latest, exaone3.5:7.8b, qwen3-embedding:4b

## Inbox

- [ ] Weekly Profile Growth Review 자동화 후보
  - owner: 제리에
  - support: 페른, 플람메, 아우라, 프리렌
  - 조건: 각 프로필 산출물이 충분할 때만 요약

- [ ] Weekly Obsidian Hygiene Report 자동화 후보
  - owner: 제리에
  - support: 레르넨, 게나우
  - 조건: 삭제·이동 없이 후보 리포트만

- [ ] Creative Prompt Library Index 자동화 후보
  - owner: 위벨
  - archive: 제리에
  - 조건: 재사용 프롬프트와 결과 링크가 있을 때만

- [ ] Local LLM Availability Report 자동화 후보
  - owner: 란트
  - archive: 제리에
  - 조건: 모델 생성 호출 없이 endpoint와 모델 목록만

- [x] OpenAI/API Token Budget Audit
  - owner: 제리에
  - support: 아우라, 란트, 프리렌
  - 조건: no-agent 스크립트로 cloud/API/Codex/Hermes-chat 위험 후보만 감시
  - 출력: `운영_System/Reports_리포트/OpenAI Token Budget Audit.md`

## Triage / 페른 라인

- [ ] 새 요청은 카드로 만들고 목적·출처·소유자·위험 여부를 붙인다.
- [ ] 불명확한 요청은 실행하지 말고 missing context로 표시한다.
- [ ] 장기 규칙 후보는 플람메로 보낸다.
- [ ] 구현 후보는 프리렌으로 보낸다.
- [ ] 보존 후보는 제리에로 보낸다.

## Principle Gate / 플람메 라인

- [ ] 자동화할 이유를 한 문장 원칙으로 남긴다.
- [ ] WIP 제한을 둔다.
- [ ] 2주 이상 쓰지 않은 자동화는 폐기/보류 후보로 내린다.
- [ ] 같은 파일/정책 충돌은 원칙 리뷰 후 진행한다.

## Risk Gate / 아우라 라인

- [ ] prompt injection 의심 카드 태그
- [ ] authority impersonation 의심 카드 태그
- [ ] scope creep 의심 카드 태그
- [ ] secrets/cost/external/destructive 위험은 아이젠에게 승격

## Execution / 프리렌 라인

- [ ] Obsidian 자동화 스크립트는 no-agent deterministic 우선
- [ ] 파일 범위, 금지 파일, 테스트, rollback, stop condition 명시
- [ ] Codex 실행은 자동 예약 금지
- [ ] 로컬 LLM 필요 시 guard 조건 명시

## Archive Judgment / 제리에 라인

- [ ] 출처 없는 기록은 보류
- [ ] 맥락 없는 감상은 폐기
- [ ] 재사용 조건 없는 요약은 압축 또는 보류
- [ ] 완료 카드 중 장기 보존 후보만 Decision/Library로 승격

## Active Automations

- [x] 제리에 Series Library of Grimoires 서재 동기화
  - schedule: 매일 04:20
  - mode: no-agent
  - output: `운영_System/서재_Library/`

- [x] 제리에 로컬 페른 운영 브리핑
  - schedule: 매일 04:35
  - mode: no-agent
  - output: local-only briefing

- [x] 제리에 Grimoire Kanban 갱신
  - schedule: 매일 05:00
  - mode: no-agent
  - output: `운영_System/Kanban_칸반/Hermes Grimoire Library Kanban.md`

- [x] 제리에 OpenAI Token Budget Audit
  - schedule: 매일 05:10
  - mode: no-agent
  - output: `운영_System/Reports_리포트/OpenAI Token Budget Audit.md`

- [x] 제리에 조사목록 분류
  - schedule: 매일 23:40
  - mode: no-agent
  - output: `수집_Inbox/조사목록_ResearchQueue/`

## Review

- [ ] 첫 7일 동안 보드가 실제로 도움이 되는지 확인
- [ ] Telegram으로 매일 알림을 보내지 않는다. 필요하면 힘멜이 요청할 때만 요약한다.
- [ ] 쓸모 없는 카드는 늘리지 않는다.

## Archive

- [ ] 유용성이 검증된 자동화만 `Hermes Grimoire Library Operating Charter`에 승격
- [ ] 폐기 자동화는 이유와 날짜만 남기고 제거 후보로 이동
