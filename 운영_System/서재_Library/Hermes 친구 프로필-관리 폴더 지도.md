---
type: system-note
status: active
created: 2026-06-07
updated: 2026-06-20
project: hermes-library-sync
area:
  - obsidian-automation
topics:
  - hermes-profile-library
  - profile-folder-map
  - friends-profiles
tags:
  - system
  - ai-agent
  - library
  - obsidian
  - profile-map
summary: Hermes 친구 프로필과 각 프로필이 관리하는 폴더/서재 위치를 Serie's Library of Grimoires vault에서 한눈에 보기 위한 지도.
related:
  - "[[서재 색인]]"
  - "[[서재 세션 - Hermes 프로필 서재 동기화]]"
---
# Hermes 친구 프로필-관리 폴더 지도

마지막 확인: `2026-06-20T16:37:19+09:00`

## 목적

이 노트는 프리렌, 아우라, 페른, 플람메, 제리에 및 추후 추가될 친구 프로필들이 각자 관리하는 폴더를 `Serie's Library of Grimoires` vault에서 한눈에 찾기 위한 색인이다.

원본 권위는 각 Hermes 프로필 폴더와 역할 설정 파일에 있다. 이 노트는 길잡이일 뿐이며, secrets/auth/session DB는 색인 대상이 아니다.

## 읽기 원칙

- 프로필 루트: 각 친구가 사용하는 Hermes 프로필의 작업 루트.
- 서재 루트: 장기 보존용 파일 서재가 있는 경우의 위치.
- Serie's Library of Grimoires 반영 위치: Obsidian `Serie's Library of Grimoires` vault 안에서 제리에가 보기 쉽게 만든 반영 폴더.
- 민감 제외: `.env`, 토큰, OAuth, 브라우저/쿠키, 세션 DB, 인증 파일은 열람·복제·색인하지 않는다.

## 핵심 친구 프로필

| 표시 이름 | 프로필 ID | 역할 | 프로필 루트 | 주요 관리 폴더 | Serie's Library of Grimoires 반영 위치 | 상태 |
|---|---|---|---|---|---|---|
| 페른 | `fern` | 메인 비서·상위 조율 | `/home/hojun/hermes-lab/.hermes/profiles/fern` | `home/`, `workspace/`, `plans/`, `scripts/`, `library/` | `운영_System/서재_Library/프로필별/fern/` | 서재 루트 있음, 항목 없음 |
| 프리렌 | `friren` | 코딩·자동화·구현 권한 | `/home/hojun/hermes-lab/.hermes/profiles/friren` | `library/`, `scripts/`, `plugins/`, `state/` | `운영_System/서재_Library/프로필별/friren/` | 서재 항목 반영 중 |
| 제리에 | `serie` | 기억 사서·Serie's Library of Grimoires 대도서관 운영 정본 | `/home/hojun/hermes-lab/.hermes/profiles/serie` | `library/obsidian-grand-library/`, `library/graduate-school/`, `library/entries/`, `skills/note-taking/obsidian/` | `운영_System/서재_Library/` | 이 색인의 관리 주체 |
| 제리에 레거시 | `memory` | 과거 제리에 별칭·레거시 경로 | `/home/hojun/hermes-lab/.hermes/profiles/memory` | `SOUL.md` | 직접 반영 없음 | 현재 운영 정본 아님 |
| 아우라 | `aura` | 방어적 레드팀·프롬프트 주입 점검 | `/home/hojun/hermes-lab/.hermes/profiles/aura` | `inbox/`, `library/`, `session_backups/` | `운영_System/서재_Library/프로필별/aura/` | 서재 루트 있음, 색인 파일 없음 |
| 플람메 | `flamme` | 원칙·장기 시스템 설계 | `/home/hojun/hermes-lab/.hermes/profiles/flamme` | `inbox/`, `library/`, `session_backups/` | `운영_System/서재_Library/프로필별/flamme/` | 서재 루트 있음, 색인 파일 없음 |
| 헤대리 | `hedaeri` | routine office/admin deputy | `/home/hojun/hermes-lab/.hermes/profiles/hedaeri` | `비서실/`, `plugins/`, `state-snapshots/` | 후보: `운영_System/서재_Library/프로필별/hedaeri/` | 별도 서재 없음 |
| 쵸파 | `chopper` | 프레스티지유학 WordPress draft·template·page production | `/home/hojun/hermes-lab/.hermes/profiles/chopper` | `library/prestige-wordpress/`, `library/prestige-wordpress/써니호/`, `scripts/`, `skills/productivity/prestige-wordpress-pages/` | `운영_System/서재_Library/프로필별/chopper/` | `써니호` 전달사항 반영 |

## 확장 친구 프로필 후보

| 표시 이름 | 프로필 ID | 역할 | 프로필 루트 | 주요 관리 폴더 | Serie's Library of Grimoires 반영 상태 |
|---|---|---|---|---|---|
| 아이젠 | `eisen` | 안전·권한 검토 | `/home/hojun/hermes-lab/.hermes/profiles/eisen` | `skills/`, `memories/` | 후보 |
| 하이터 | `heiter` | 프로젝트 분석·조사 보조 | `/home/hojun/hermes-lab/.hermes/profiles/heiter` | `skills/`, `memories/` | 후보 |
| 위벨 | `ubel` | 이미지·음악·콘텐츠 프롬프트 / Suno·YouTube Music 창작 총괄 | `/home/hojun/hermes-lab/.hermes/profiles/ubel` | `inbox/`, `skills/creative/`, `memories/`, `cache/images/` | `운영_System/서재_Library/프로필별/ubel/` — 프롬프트 특별보관 반영 |
| 베다 | `veda` | 공개자료 조사·PDF/웹 추출·OCR triage | `/home/hojun/hermes-lab/.hermes/profiles/veda` | `SOUL.md`, shared `research-extraction/` bridge | `수집_Inbox/Veda Research Intake.md`, `운영_System/서재_Library/Archive Candidate Review.md` | 제리에 검토 대기열로 접수 |
| 란트 | `resource` | 로컬 리소스·ComfyUI/LLM 충돌 감시 | profile root 미확인 | 폴더 미확인 | 후보 — 실제 폴더 확인 전 색인 승격 금지 |
| 마흐트 | `macht` | 금융·시장 위험 검토 | `/home/hojun/hermes-lab/.hermes/profiles/macht` | `skills/`, `memories/` | 후보 |
| 젠제 | `sense` | 기억 품질 검사 | `/home/hojun/hermes-lab/.hermes/profiles/sense` | `skills/`, `memories/` | 후보 |
| 레르넨 | `lernen` | 아카이브 이관·복구 계획 | `/home/hojun/hermes-lab/.hermes/profiles/lernen` | `skills/`, `memories/` | 후보 |
| 게나우 | `genau` | 사고·Telegram 라우팅 진단 | `/home/hojun/hermes-lab/.hermes/profiles/genau` | `skills/`, `memories/` | 후보 |
| 팔슈 | `falsch` | 논문 검색 false-positive screening | `/home/hojun/hermes-lab/.hermes/profiles/falsch` | `skills/`, `memories/` | 대학원 지식팀 후보 |
| 덴켄 | `denken` | 장기 전략·협상 | `/home/hojun/hermes-lab/.hermes/profiles/denken` | `skills/`, `memories/` | 후보 |
| 메토데 | `methode` | 복구 커뮤니케이션 | `/home/hojun/hermes-lab/.hermes/profiles/methode` | `skills/`, `memories/` | 후보 |
| 힘멜 시스템 보조 | `sein` | 보조 작업 공간 | `/home/hojun/hermes-lab/.hermes/profiles/sein` | `home/`, `workspace/`, `plans/`, `skins/` | 후보 |
| 헤르미온느 | `hermione` | 보조 작업 공간 | `/home/hojun/hermes-lab/.hermes/profiles/hermione` | `home/`, `skills/`, `memories/` | 후보 |

## Obsidian에서 쓰는 연결 방식

- 전체 지도: `[[Hermes 친구 프로필-관리 폴더 지도]]`
- 실제 서재 반영본: `[[서재 색인]]`
- 동기화 운영 원칙: `[[서재 세션 - Hermes 프로필 서재 동기화]]`
- 프로필별 반영 폴더: `운영_System/서재_Library/프로필별/<profile>/`

## 추가 등록 기준

새 친구 프로필이 생기면 다음 조건을 채운 뒤 이 지도에 올린다.

1. 표시 이름과 profile ID가 확인될 것.
2. 역할·책임 범위가 최소 한 문장으로 확인될 것.
3. 관리 폴더가 실제로 존재할 것.
4. Serie's Library of Grimoires vault에 반영할 위치가 정해질 것.
5. secrets/auth/session DB를 포함하지 않는다고 확인될 것.

출처, 맥락, 재사용 조건이 없는 폴더는 여기 올리지 않는다. 그런 것은 기억이 아니라 먼지다.

## 출처

- `/home/hojun/hermes-lab/AGENTS.md`
- `/home/hojun/hermes-lab/configs/persona-role-map.yaml`
- `/home/hojun/hermes-lab/.hermes/profiles/` 실제 폴더 목록 확인
- `/home/hojun/hermes-lab/.hermes/profiles/chopper/profile.yaml`
- `/home/hojun/hermes-lab/.hermes/profiles/chopper/SOUL.md`
- `/home/hojun/hermes-lab/.hermes/profiles/chopper/memories/MEMORY.md`
- `/home/hojun/hermes-lab/.hermes/profiles/chopper/library/prestige-wordpress/써니호/제리에_전달사항.md`
- `/home/hojun/hermes-lab/.hermes/profiles/serie/SOUL.md`
- `/home/hojun/hermes-lab/.hermes/profiles/ubel/SOUL.md`
- `/home/hojun/hermes-lab/.hermes/profiles/veda/SOUL.md`
- `/home/hojun/hermes-lab/.hermes/profiles/falsch/SOUL.md`
- `[[대도서관 접수 규칙 - SOUL 반영]]`
- `[[서재 세션 - Hermes 프로필 서재 동기화]]`
