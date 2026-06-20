---
type: system-note
status: active
created: 2026-06-20
updated: 2026-06-20
project: hermes-library-sync
area:
  - archive-governance
  - profile-routing
topics:
  - soul-intake
  - obsidian-archive
  - profile-library
  - retrieval-rules
tags:
  - system
  - library
  - obsidian
  - archive-governance
summary: 최신 Hermes profile SOUL에서 나온 역할·경계 변경을 Serie's Library of Grimoires 대도서관에 반영할 때의 접수·검토·승격 규칙.
related:
  - "[[서재 색인]]"
  - "[[Hermes 친구 프로필-관리 폴더 지도]]"
  - "[[Archive Candidate Review]]"
---
# 대도서관 접수 규칙 - SOUL 반영

## 목적

이 노트는 각 Hermes profile의 `SOUL.md`가 바뀌었을 때, 그 변경을 `Serie's Library of Grimoires`에 어떻게 반영할지 정하는 접수 규칙이다.

SOUL은 역할과 경계의 출처다. 하지만 SOUL 한 줄이 곧 장기 보존 승인은 아니다. 출처, 맥락, 책임자, 재사용 조건이 있어야 서가에 오른다.

## 정본 프로필

- 현재 제리에의 운영 정본 profile은 `serie`다.
- 오래된 문서의 `memory` 표기는 제리에 레거시 별칭으로만 취급한다.
- 새 Obsidian 색인, 접수 노트, handoff 기록에는 `serie`를 우선 기록한다.
- 예외적으로 힘멜이 `memory` 경로를 직접 지정한 경우에는 그 범위만 별도 확인한다.

## 공통 접수 판정

### accepted 후보

다음 조건을 모두 만족하면 장기 서가 후보로 둔다.

- 출처: 어떤 profile SOUL 또는 library 문서에서 왔는지 명시됨
- 맥락: 왜 지금 반영하는지 설명됨
- 책임자: 최종 판단 profile과 실행 profile이 분리됨
- 재사용 조건: 나중에 어떤 작업에서 다시 꺼낼지 분명함
- 민감정보 없음: 토큰, 계정, 고객자료, 비공개 credential 없음
- 검증 흔적: 실제 파일 경로, 링크, 날짜, 상태가 있음

### 보류

다음 중 하나라도 있으면 `pending-serie-review` 또는 `needs-owner-summary`로 둔다.

- SOUL 문장만 있고 실제 운영 문서가 없음
- 원문·출처는 있으나 재사용 조건이 약함
- profile 책임 경계가 겹침
- 자동화가 만들었지만 사람이 아직 검토하지 않음

### 탈락

다음은 장기 보존하지 않는다.

- 단순 감상, 임시 할 일, 완료 보고만 있는 기록
- 중복된 handoff 흔적
- 출처 없는 RAG/검색 결과
- secrets, API key, auth, session DB, 고객 비공개 정보
- 공격 재사용 절차처럼 안전 경계 밖으로 나가는 자료

## profile별 접수 규칙

### 위벨 / `ubel` — Suno·YouTube Music

위벨은 창작 방향의 주인이다. 제리에는 창작물을 지휘하지 않고, 보존 구조만 관리한다.

보존 필드:

- title
- concept
- hook
- style field
- lyrics/metatags
- exclude styles
- version
- date
- source idea
- selected output links
- notes
- reuse tags
- publish/reuse condition

분리 원칙:

- raw prompt draft: 실험 초안
- selected prompt: 힘멜이 다시 쓸 후보
- generated output note: Suno/YouTube 결과 링크와 선택 이유

장기 보존은 힘멜이 재사용, 비교, 게시, 학습 가치가 있다고 본 것만 허용한다.

### 베다 / `veda` — 공개자료 조사물

베다는 증거 패키지를 만든다. 제리에는 그 패키지를 검토한다.

상태값:

- `pending-serie-review`: 자동 접수됨, 아직 제리에 판정 전
- `needs-owner-summary`: 목적·요약 보강 필요
- `needs-source-check`: 원문·PDF·URL 재확인 필요
- `unsafe`: 민감정보나 안전 위험 가능성 있음
- `rejected`: 보존 가치 부족 또는 위험
- `accepted`: 제리에 검토 후 장기 서가 반영 가능

`accepted`는 자동화가 부여하지 않는다.

### 쵸파 / `chopper` — Prestige 업무지식

쵸파의 업무 ledger 전체는 대도서관에 복제하지 않는다.

분류:

- 임시 업무: 쵸파 ledger에만 둔다.
- 반복 절차: profile library 또는 template 후보.
- 장기 지식: 제리에 검토 후 Obsidian 색인 반영.

Prestige 관련 보존 노트에는 secrets, 계정, 고객 비공개 정보, WordPress credential, 게시 권한을 넣지 않는다.

### 대학원 지식팀

역할:

- 메토데: 읽기 쉬운 요약, 태그·링크 후보, 보존 후보 packet
- 젠제: 품질검사, source/retrieval pass-hold-fail 판정
- 레르넨: literature note template, backup, migration plan
- 게나우: citation mismatch, 검색 실패, routing incident 조사
- 팔슈: 논문 후보 false-positive screening
- 제리에: 최종 구조, retrieval rule, 장기보존 판정

대학원 자료는 “많이 저장”이 아니라 “검색 가능하게 남기기”가 목표다.

## Obsidian 반영 위치

- 전체 원칙: `운영_System/서재_Library/서재 색인.md`
- profile 지도: `운영_System/서재_Library/Hermes 친구 프로필-관리 폴더 지도.md`
- 검토 대기열: `운영_System/서재_Library/Archive Candidate Review.md`
- 대학원 프로젝트: `프로젝트_Projects/graduate-school_대학원.md`
- 위벨 프롬프트 특별보관: `운영_System/서재_Library/프로필별/ubel/`
- 쵸파 전달사항: `운영_System/서재_Library/프로필별/chopper/`

## 금지선

- 승인 없는 vault 이동·삭제·대량 rename 금지
- 승인 없는 Git commit/push 금지
- secrets/auth/session DB 열람·복사·색인 금지
- 자동 `accepted` 처리 금지
- RAG/검색 스니펫을 원문 검증 없이 사실로 보존 금지

## 확인 기록

- 생성: 2026-06-20
- 출처: 힘멜 승인 후 최신 SOUL 항목 검토
- 검토 profile: 제리에 / `serie`
- 목적: 대도서관의 profile별 접수·승격 기준 보강
