---
type: system-dashboard
status: active
created: 2026-06-07
updated: 2026-06-07
owner_profile: memory
owner_name: 제리에
vault: Serie's Library of Grimoires
tags:
  - system
  - hermes
  - profiles
  - automation
  - dashboard
summary: Hermes 프로필들이 Serie's Library of Grimoires vault와 자동화 안에서 어떤 역할을 맡는지 한눈에 보는 운영 보드.
related:
  - "[[운영_System/Reports_리포트/2026-06-07 Serie's Library of Grimoires Vault AI Automation Status Report]]"
  - "[[운영_System/서재_Library/서재 색인]]"
  - "[[운영_System/서재_Library/서재 세션 - Hermes 프로필 서재 동기화]]"
---
# Hermes Profile Automation Board

## 목적

이 보드는 Hermes 프로필들이 Serie's Library of Grimoires vault와 자동화 안에서 어떤 역할을 맡는지 한눈에 보기 위한 운영 색인이다.

제리에 판정:

- 이 보드는 실행 로그가 아니라 역할 지도다.
- 세부 증거와 점검 결과는 리포트에 둔다.
- 오래 남길 결정은 `06_Decisions` 또는 `운영_System/서재_Library`로 승격한다.

## 현재 Serie's Library of Grimoires vault 연결

- Vault: `Serie's Library of Grimoires`
- 경로: `/mnt/c/Users/Hojun/Documents/Obsidians/Serie's Library of Grimoires`
- 제리에 관리 상태: active
- 로컬 Ollama HTTP: active
- WSL Ollama CLI: missing
- Smart Connections 흔적: 있음
- 제리에 no-agent cron: active

## 프로필 역할 지도

### 페른 / `fern`

- 핵심 역할: 지휘, 라우팅, 사용자 의도 정리
- Serie's Library of Grimoires에서 볼 산출물:
  - Daily Command Board
  - 운영 브리핑
  - 미완료/우선순위 정리
- 자동화 적합도: 높음
- 제리에 보존 기준:
  - 매일 원문 전체가 아니라 요약과 결정만 보존

### 플람메 / `flamme`

- 핵심 역할: 원칙, 장기 방향, 운영 의식
- Serie's Library of Grimoires에서 볼 산출물:
  - Weekly Principles
  - 장기 운영 규칙
  - 프로필 간 권한/충돌 원칙
- 자동화 적합도: 중간
- 제리에 보존 기준:
  - 반복되는 문제에서 추출된 원칙만 보존

### 프리렌 / `friren`

- 핵심 역할: 구현, 코드, 자동화, Codex 작업 범위화
- Serie's Library of Grimoires에서 볼 산출물:
  - Implementation Review
  - Codex Prompt Candidates
  - 테스트/중지 조건
  - 서재 동기화 항목
- 현재 반영:
  - `운영_System/서재_Library/프로필별/friren/`
- 자동화 적합도: 높음
- 제리에 보존 기준:
  - 파일 범위, 검증 결과, rollback 조건이 있는 구현 기록만 보존

### 제리에 / `memory`

- 핵심 역할: 기억 품질, Obsidian 구조, 보존 심사, 색인
- Serie's Library of Grimoires에서 볼 산출물:
  - `운영_System/Reports_리포트/2026-06-07 Serie's Library of Grimoires Vault AI Automation Status Report.md`
  - `운영_System/서재_Library/서재 색인.md`
  - `운영_System/서재_Library/서재 세션 - Hermes 프로필 서재 동기화.md`
- 자동화 적합도: 매우 높음
- 제리에 보존 기준:
  - 출처, 맥락, 재사용 조건이 없는 기록은 보류 또는 폐기

### 아우라 / `aura`

- 핵심 역할: 리스크, 환각, 조작, 권한 남용 감시
- Serie's Library of Grimoires에서 볼 산출물:
  - Risk Audit
  - Prompt Injection Watch
  - Unsafe Automation Candidates
- 자동화 적합도: 중간
- 제리에 보존 기준:
  - 위험 징후와 근거가 있는 경고만 보존

### 헤대리 / `hedaeri`

- 핵심 역할: 행정, 일정, 구매리스트, 회의록 초안
- Serie's Library of Grimoires에서 볼 산출물:
  - Admin Checklist
  - Purchase List Snapshot
  - Meeting Memo Draft
- 자동화 적합도: 높음
- 제리에 보존 기준:
  - 단기 체크리스트는 임시, 반복 패턴만 보존

### 위벨 / `creative`

- 핵심 역할: 창작 방향, Suno/YouTube/이미지 프롬프트
- Serie's Library of Grimoires에서 볼 산출물:
  - Creative Prompt Library
  - Suno Version Log
  - YouTube Title Experiments
- 자동화 적합도: 중간
- 제리에 보존 기준:
  - 재사용 가능한 프롬프트, 버전, 결과 링크, 배운 점만 보존

### 란트 / `resource`

- 핵심 역할: 로컬 리소스, Ollama/ComfyUI 부하, VRAM 감시
- Serie's Library of Grimoires에서 볼 산출물:
  - Local Resource Status
  - LLM/ComfyUI Conflict Watch
- 자동화 적합도: 높음
- 제리에 보존 기준:
  - 수치와 시각이 있는 상태 기록만 보존

### 마흐트 / `macht`

- 핵심 역할: 시장 정보, 공시 요약, 투자 리스크 감사
- Serie's Library of Grimoires에서 볼 산출물:
  - Market Intelligence Brief
  - Disclosure Summary
  - Portfolio Risk Notes
- 자동화 적합도: 중간
- 제리에 보존 기준:
  - 출처·날짜 없는 시장 판단은 폐기
  - 매수매도 지시는 기록하지 않음

## 현재 예약 자동화 요약

### 제리에 no-agent Serie's Library of Grimoires vault nightly research queue

- 시간: 매일 23:40
- 상태: active
- 목적: 조사목록 분류
- 출력: Serie's Library of Grimoires vault 내부 리포트/분류 기록

### 제리에 Series Library of Grimoires 서재 동기화

- 시간: 매일 04:20
- 상태: active
- 목적: Hermes profile library를 Serie's Library of Grimoires vault에 반영
- 출력: `운영_System/서재_Library/`

### 제리에 로컬 페른 운영 브리핑

- 시간: 매일 04:35
- 상태: active
- 목적: 로컬-only 운영 브리핑
- 출력: 아직 첫 실행 기록 없음

## 다음 승격 후보

승격 후보 목록의 단일 출처는 [[운영_System/Kanban_칸반/Hermes Grimoire Library Kanban|Hermes Grimoire Library Kanban]]의 `Inbox` 섹션이다.
중복 관리를 막기 위해 이 보드에는 더 이상 후보 목록을 직접 나열하지 않는다.

## 운영 금지선

- 자동 삭제 금지
- 자동 이동 금지
- 대량 리네임 금지
- secrets/auth/session DB 접근 금지
- Google Drive 광범위 접근 금지
- 출처 없는 RAG 결과를 사실로 보존 금지
- Codex 실행 자동화 금지
- Git push/merge/deploy 자동화 금지

## 제리에의 보존 문턱

기록은 다음 조건을 만족해야 장기 보존 후보가 된다.

- 제목이 명확함
- 출처가 있음
- 작성/확인 날짜가 있음
- 담당 프로필이 있음
- 재사용 조건이 있음
- 위험 권한이 분리되어 있음
- 나중에 다시 꺼내도 의미가 무너지지 않음

그 아래의 기록은 임시 메모면 충분하다.
