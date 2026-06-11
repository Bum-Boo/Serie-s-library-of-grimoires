---
type: automation-status-report
status: active
created: 2026-06-07
updated: 2026-06-11
owner_profile: memory
owner_name: 제리에
vault: Serie's Library of Grimoires
scope:
  - obsidian-ai-plugins
  - local-ollama
  - hermes-profile-cron
  - profile-library-sync
tags:
  - system
  - obsidian
  - hermes
  - automation
  - local-llm
summary: Serie's Library of Grimoires vault의 로컬 AI 연결, 제리에 자동화, Hermes 프로필별 가시성을 한눈에 보기 위한 상태 점검 리포트.
---
# 2026-06-07 Serie's Library of Grimoires Vault AI Automation Status Report

## 판정

Serie's Library of Grimoires vault는 현재 제리에가 관리 대상으로 삼고 있다.

- 기본 vault 경로: `/mnt/c/Users/Hojun/Documents/Obsidians/Serie's Library of Grimoires`
  - 2026-06-11 확인: 위 경로는 WSL에서 본 Windows `C:\Users\Hojun\Documents\Obsidians\Serie's Library of Grimoires`와 같은 vault를 가리킨다.
  - 기록 원칙: WSL 자동화/스크립트는 `/mnt/c/...`, Windows/Obsidian 사용자 안내는 `C:\Users\...` 표기를 쓴다.
- 현재 제리에 프로필의 Obsidian 경로도 Serie's Library of Grimoires vault로 설정되어 있음.
- 제리에 소유의 no-agent 예약 작업이 Serie's Library of Grimoires vault에 기록을 반영하고 있음.
- Obsidian 내부에는 로컬 AI/임베딩 플러그인 흔적이 있음.
- Ollama는 CLI 명령으로는 보이지 않지만, HTTP endpoint `http://localhost:11434`는 응답함.

## 확인 시각

- 확인일: 2026-06-07
- 실행 환경: Hermes `memory` profile / WSL
- 기준 vault: Serie's Library of Grimoires

## 로컬 모델 연결 상태

### Ollama

- HTTP 연결: 정상
- 확인 endpoint: `http://localhost:11434/api/tags`
- CLI 상태: WSL 현재 셸에서 `ollama` 명령은 없음

확인된 모델:

- `qwen3:30b-korean-final`
- `qwen3:8b-korean-final`
- `qwen3:30b`
- `granite3-dense:8b`
- `phi4-mini:latest`
- `bge-m3:latest`
- `exaone3.5:7.8b`
- `qwen3-embedding:4b`
- `qwen3-embedding:0.6b`
- `gemma3:4b`
- `qwen3:4b`
- `qwen3:8b`

### 제리에 판정

- 로컬 모델 연결은 **HTTP 기준 정상**이다.
- WSL 셸에서 CLI가 없으므로 자동화는 `ollama` CLI보다 HTTP API 또는 기존 스크립트 방식을 우선해야 한다.
- 무거운 로컬 LLM 작업은 다른 프로필/ComfyUI 작업과 충돌하지 않게 `local_llm_guard` 기준을 따라야 한다.

## Obsidian AI 플러그인 상태

- `copilot`
  - 설치: 예
  - 활성화: 예
  - 설정 파일: 있음
  - 실행 번들: 있음

- `smart-connections`
  - 설치: 예
  - 활성화: 예
  - 설정 파일: 있음
  - 실행 번들: 있음

- `vaultwright-chat-review`
  - 설치: 예
  - 활성화: 아니오
  - 설정 파일: 없음
  - 실행 번들: 있음

- `obsidian-tasks-plugin`
  - 설치: 예
  - 활성화: 예

- `dataview`
  - 설치: 예
  - 활성화: 예

- `omnisearch`
  - 설치: 예
  - 활성화: 예

## Smart Connections / 임베딩 흔적

- `.smart-env` 존재: 예
- `.smart-env` 파일 수: 94
- `.smart-env/multi` 파일 수: 91

판정:

- Serie's Library of Grimoires vault 안에 임베딩/스마트 연결 흔적이 충분히 있다.
- 단, 이 리포트는 임베딩 품질까지 평가하지 않았다.
- 다음 점검에서는 `.smart-env`의 최신 갱신 시각과 누락 노트를 따로 확인할 수 있다.

## 제리에 소유 예약 자동화

### 1. 제리에 no-agent Serie's Library of Grimoires vault nightly research queue

- job id: `63386e318291`
- 스케줄: 매일 23:40
- 방식: no-agent script
- 소유 profile: `memory`
- 작업 위치: Serie's Library of Grimoires vault
- 상태: enabled / scheduled
- 최근 상태: ok
- 역할: 조사목록 분류를 Serie's Library of Grimoires vault에 저장

### 2. 제리에 Series Library of Grimoires 서재 동기화

- job id: `c6e339872f53`
- 스케줄: 매일 04:20
- 방식: no-agent script
- 소유 profile: `memory`
- 작업 위치: Serie's Library of Grimoires vault
- 상태: enabled / scheduled
- 최근 상태: ok
- 역할: Hermes 프로필별 독립 서재를 Serie's Library of Grimoires vault의 `운영_System/서재_Library/`에 반영

### 3. 제리에 로컬 페른 운영 브리핑

- job id: `0204cfd33081`
- 스케줄: 매일 04:35
- 방식: no-agent script
- 소유 profile: `memory`
- 작업 위치: `/home/hojun/hermes-lab`
- 상태: enabled / scheduled
- 최근 상태: 아직 실행 기록 없음
- 역할: 승인된 Hermes profile library를 읽어 로컬-only 운영 브리핑 생성

## 프로필별 한눈 보기

### 페른 / `fern`

- 역할: 사용자 의도 해석, 라우팅, 최종 조정
- 현재 Serie's Library of Grimoires 반영 상태: 로컬 운영 브리핑 자동화의 간접 대상
- 추천 출력물: `Daily Command Board`, `운영 브리핑`, `오늘의 지휘판`
- 제리에 판정: 매일 요약 대상으로 적합. 단, 모든 대화 원문을 보존하면 안 됨.

### 플람메 / `flamme`

- 역할: 원칙, 장기 방향, 운영 의식 설계
- 현재 Serie's Library of Grimoires 반영 상태: 별도 서재 항목은 아직 확인되지 않음
- 추천 출력물: `Weekly Principles`, `Decision Principle Review`
- 제리에 판정: 주간 단위 보존에 적합. 짧은 잡담은 보존 대상 아님.

### 프리렌 / `friren`

- 역할: 코드, 구현, 자동화, Codex 작업 범위화
- 현재 Serie's Library of Grimoires 반영 상태: 서재 동기화에 1개 항목 반영됨
- 반영 위치: `운영_System/서재_Library/프로필별/friren/`
- 추천 출력물: `Implementation Review`, `Codex Prompt Candidates`, `Test/Stop Conditions`
- 제리에 판정: 구현 결정은 출처·파일 범위·검증 결과가 있을 때만 장기 보존.

### 제리에 / `memory`

- 역할: 기록 구조, 보존 심사, 색인, Obsidian 자동화 관리
- 현재 Serie's Library of Grimoires 반영 상태: 직접 관리 중
- 주요 출력물:
  - `운영_System/서재_Library/서재 색인.md`
  - `운영_System/서재_Library/서재 세션 - Hermes 프로필 서재 동기화.md`
  - `운영_System/Reports_리포트/2026-06-07 Serie's Library of Grimoires Vault AI Automation Status Report.md`
- 제리에 판정: Serie's Library of Grimoires vault의 archive owner 역할을 이미 수행 중.

### 아우라 / `aura`

- 역할: 리스크, 조작, 환각, 권한 남용 감시
- 현재 Serie's Library of Grimoires 반영 상태: 별도 서재 항목은 아직 확인되지 않음
- 추천 출력물: `Risk Audit`, `Prompt Injection Watch`, `Unsafe Automation Candidates`
- 제리에 판정: 자동 수정 권한보다 경고 리포트 권한이 어울림.

### 헤대리 / `hedaeri`

- 역할: 행정, 일정, 구매리스트, 문서 초안
- 현재 Serie's Library of Grimoires 반영 상태: 별도 서재 항목은 아직 확인되지 않음
- 추천 출력물: `Admin Checklist`, `Purchase List Snapshot`, `Meeting Memo Draft`
- 제리에 판정: 단기 업무가 많으므로 장기 보존은 압축본만.

### 위벨 / `creative`

- 역할: 창작 방향, Suno/YouTube/이미지 프롬프트
- 현재 Serie's Library of Grimoires 반영 상태: 별도 서재 항목은 아직 확인되지 않음
- 추천 출력물: `Creative Prompt Library`, `Suno Version Log`, `YouTube Title Experiments`
- 제리에 판정: 재사용 가능한 프롬프트와 결과 링크만 보존. 단순 감상은 폐기.

### 란트 / `resource`

- 역할: 로컬 리소스, ComfyUI, Ollama, VRAM/부하 감시
- 현재 Serie's Library of Grimoires 반영 상태: 별도 서재 항목은 아직 확인되지 않음
- 추천 출력물: `Local Resource Status`, `LLM/ComfyUI Conflict Watch`
- 제리에 판정: 로컬 LLM 자동화와 충돌 방지에 필요. 숫자 중심 리포트가 적합.

### 마흐트 / `macht`

- 역할: 시장 정보, 공시 요약, 투자 리스크 감사
- 현재 Serie's Library of Grimoires 반영 상태: 별도 서재 항목은 아직 확인되지 않음
- 추천 출력물: `Market Intelligence Brief`, `Disclosure Summary`, `Portfolio Risk Notes`
- 제리에 판정: 사실·출처·날짜 없는 판단은 보존 금지. 매수매도 지시도 금지.

## 현재 자동화 성숙도

- 읽기 전용/리포트 자동화: 가능
- no-agent 결정적 스크립트: 이미 사용 중
- 로컬 모델 HTTP 호출: 가능
- Obsidian 플러그인 기반 AI 연결: 흔적 있음
- 자동 삭제/이동/대량 리네임: 금지 유지
- Google Drive 광범위 접근: 금지 유지
- secrets/auth/session DB 접근: 금지 유지

## 다음 권장 작업

1. `Profile-Growth-Index.md` 생성
   - 모든 프로필의 역할, 현재 자동화, 최근 산출물을 한눈에 보는 색인.

2. `Weekly Profile Growth Review` 예약
   - 주 1회 각 프로필이 힘멜에게 실제로 어떤 도움을 줬는지 기록.
   - 처음에는 no-agent 또는 최소 LLM 방식.

3. `Obsidian Hygiene Report` 예약
   - 깨진 링크, frontmatter 누락, 빈 노트, 미참조 첨부파일을 점검.
   - 삭제·이동 없이 후보만 보고.

4. `Local LLM Availability Report` 예약
   - Ollama HTTP endpoint, 모델 목록, guard 필요 여부를 점검.
   - 무거운 모델 호출 없이 상태만 확인.

5. 프로필별 서재 등록 확대
   - 현재 Serie's Library of Grimoires에 반영된 프로필 서재는 `friren`만 확인됨.
   - 다른 프로필도 library/index.jsonl과 entries 구조를 갖추면 제리에 동기화 대상에 넣을 수 있음.

## 보존 기준

이 리포트 이후 Serie's Library of Grimoires vault 자동화 기록은 다음 기준을 넘을 때만 장기 보존한다.

- 출처가 명확할 것
- 생성 시각이 있을 것
- 담당 프로필이 분명할 것
- 재사용 조건이 있을 것
- 위험 권한이 구분되어 있을 것
- 자동화가 삭제·이동·비밀 접근을 하지 않을 것

출처 없는 감상과 막연한 기대는 서가에 올리지 않는다.
