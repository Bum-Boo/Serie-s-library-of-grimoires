---
type: operating-plan
status: prepared
created: 2026-06-07
updated: 2026-06-07
owner_profile: memory
owner_name: 제리에
reviewer_profile: flamme
reviewer_name: 플람메
vault: Serie's Library of Grimoires
tags:
  - system
  - obsidian
  - github
  - sync
  - automation
summary: Serie's Library of Grimoires vault를 GitHub private repository로 동기화하기 위한 범위, 제외 규칙, 첫 설정 절차, 다른 컴퓨터 복구 절차.
---
# GitHub Vault Sync Operating Plan

## 판정

제리에가 관리 대상으로 삼은 Obsidian vault는 아래 경로의 **Serie's Library of Grimoires vault**로 본다.

- Vault: `/mnt/c/Users/Hojun/Documents/Obsidians/Serie's Library of Grimoires`
- 현재 Git 상태: 로컬 git 저장소이며 아직 tracked file 0개
- 현재 branch: `main`
- 현재 remote: `origin` → `https://github.com/Bum-Boo/Serie-s-library-of-grimoires.git` / git config 표시상 SSH rewrite 가능
- 권장 remote 정책: GitHub **private repository**

힘멜이 지정한 연결 대상:

- Remote: `https://github.com/Bum-Boo/Serie-s-library-of-grimoires`
- 확인 결과: GitHub API 기준 **public repository**
- 조치: local `origin` remote 연결, branch `main` 정리, 힘멜의 public push 명시 승인 후 첫 vault sync push 완료.

Brain 계열 vault도 발견되었지만, 현재 구조와 제리에 리포트 기준으로 자동화 대상은 Link가 우선이다.

## 첫 원칙

1. **GitHub에는 지식과 운영 기록만 올린다.**
   - 노트, 템플릿, taxonomy, dashboard, 검증 스크립트, 안전한 Obsidian 설정만 포함한다.
2. **토큰·캐시·AI 대화 상태는 올리지 않는다.**
   - Copilot/Smart Connections/임베딩/cache/local state는 재현 가능한 부산물이지 보존 기록이 아니다.
3. **자동화는 삭제·이동보다 보고와 동기화를 먼저 한다.**
   - 처음에는 pull/add/commit/push까지만. 대량 정리 자동화는 별도 승인 전까지 금지.

## GitHub에 포함할 범위

권장 포함:

- `.gitignore`
- `운영_System/` 안의 Markdown 운영 기록, 템플릿, taxonomy, dashboard, 안전한 scripts
- `수집_Inbox/`, `루틴_Periodic/`, `프로젝트_Projects/`, `영역_Areas/`, `지식_Knowledge/`, `자료_Sources/`, `결과물_Outputs/`, `보관_Archive/`의 Markdown 노트
- 일반 첨부 이미지 중 개인적으로 공개해도 되는 자료
- `.obsidian/app.json`, `appearance.json`, `community-plugins.json`, `core-plugins.json`, `daily-notes.json`, `templates.json`, `types.json`
- `.obsidian/plugins/dataview/data.json`, `homepage/data.json`, `obsidian-icon-folder/data.json`, `obsidian-tasks-plugin/data.json`

조건부 포함:

- `Obsidian/Image/` 및 `Pasted image *.png`: 개인·저작권·용량 확인 후 포함
- `.obsidian/snippets/`, `.obsidian/themes/`: 테마 재현성이 필요하면 포함하되 용량이 커지면 제외

제외:

- `.smart-env/`
- `.trash/`
- `copilot/`
- `.obsidian/plugins/copilot/data.json` 및 대부분의 plugin 실행 번들
- `.obsidian/workspace*.json`
- `**/.openai-token-budget-audit-state.json`
- 토큰, 비밀번호, API key, credential, local cache, 임베딩 산출물

## 현재 준비 완료된 것

- `.gitignore`에 다음 보호 규칙을 추가했다.
  - `copilot/`
  - `.smart-env/`, `.smart-env/`
  - `**/.openai-token-budget-audit-state.json`
  - `.obsidian/workspace*.json`
  - `.obsidian/cache/`
- 수동 실행용 helper script를 추가했다.
  - `운영_System/Scripts_스크립트/sync-vault-git.sh`

## 최초 GitHub 연결 절차

아래 작업은 외부 계정과 remote 설정을 건드리므로 힘멜의 명시 승인을 받고 실행한다.

1. GitHub에서 private repository 생성
   - 예: `obsidian-link-vault-private`
   - public 금지
   - README 자동 생성은 꺼두는 편이 충돌이 적다.

2. vault root에서 remote 연결

```bash
cd /mnt/c/Users/Hojun/Documents/Obsidians/Serie's Library of Grimoires
git branch -M main
git remote add origin git@github.com:<OWNER>/<REPO>.git
# 또는 HTTPS:
# git remote add origin https://github.com/<OWNER>/<REPO>.git
```

3. 첫 커밋 전 확인

```bash
git status --short
git check-ignore -v .obsidian/plugins/copilot/data.json .smart-env copilot 운영_System/Reports_리포트/.openai-token-budget-audit-state.json
bash 운영_System/Scripts_스크립트/sync-vault-git.sh --dry-run
```

4. 첫 업로드

```bash
bash 운영_System/Scripts_스크립트/sync-vault-git.sh --commit
bash 운영_System/Scripts_스크립트/sync-vault-git.sh --push
```

## 다른 컴퓨터에서 내려받아 쓰는 절차

1. Git 설치
2. GitHub 인증 설정
3. 원하는 위치에 clone

```bash
git clone git@github.com:<OWNER>/<REPO>.git "Obsidian-Link"
# 또는 HTTPS:
# git clone https://github.com/<OWNER>/<REPO>.git "Obsidian-Link"
```

4. Obsidian에서 `Obsidian-Link` 폴더를 vault로 열기
5. 플러그인 확인
   - Copilot류 API key는 GitHub에서 내려오지 않는 것이 정상이다.
   - 필요한 key는 각 컴퓨터에서 따로 설정한다.
6. 작업 전후 동기화 습관

```bash
bash 운영_System/Scripts_스크립트/sync-vault-git.sh --pull
bash 운영_System/Scripts_스크립트/sync-vault-git.sh --push
```

## 자동화 단계

### 1단계: 수동 동기화

- 사람이 script를 직접 실행한다.
- 충돌이 나는지 3일 정도 관찰한다.

### 2단계: local scheduled backup

- 하루 1~2회 `--push` 실행.
- 단, Obsidian을 여러 컴퓨터에서 동시에 열어둔 상태에서는 자동 push를 피한다.

### 3단계: health report 자동화

- 삭제·이동 없이 다음만 보고한다.
  - uncommitted files
  - ignored 위험 파일 상태
  - 큰 첨부파일
  - 충돌 파일
  - 깨진 링크 후보

## 중지 조건

다음이 보이면 자동화는 멈춘다.

- GitHub remote가 public으로 설정됨
- secret/key/token 유사 파일이 staged 상태로 잡힘
- merge conflict 발생
- `.obsidian/plugins/copilot/data.json`이 추적 대상이 됨
- `.smart-env/`가 추적 대상이 됨
- 한 번에 100개 이상 파일 삭제가 staged 됨

## 플람메의 기준

힘멜, 이건 백업 마법이 아니라 습관이야.  
강한 자동화보다 조용히 새지 않는 구조가 먼저다.

처음부터 전부 올리려 하지 마라.  
**Serie's Library of Grimoires vault + private repo + secrets 제외 + 수동 sync 3일 관찰**.  
이 네 줄이 오래 버틸 첫 기준이다.
