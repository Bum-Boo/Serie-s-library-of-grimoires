---
type: system-note
status: active
created: 2026-06-04
updated: 2026-06-04
project:
area: ai-interactive-media
topics:
  - ai-image
  - prompt
tags:
  - ai-image
  - obsidian
summary:
related: []
---
> 참고: `{{date:YYYY-MM-DD}}`는 **Obsidian 기본 Templates**에서 날짜 삽입 토큰으로 동작합니다(설정/버전에 따라 다를 수 있음). 안 되면 날짜는 수동 입력해도 OK.

---

## 1) 카드 노트(=저장될 노트) 생성 위치 고정

호준님이 원하는 구조: `Prompts/Cards/`에 쌓이게 하기

1. 파일 탐색기에서 `Prompts/Cards/` 폴더로 이동
2. 그 폴더에서 **New note** 생성  
   예: `maid-japan-2026-02-13.md`

> 이렇게 만들면 카드가 “항상 그 디렉토리에 쌓임”.

---

## 2) 템플릿 불러오는 방법 (2가지)

### 방법 A) 커맨드 팔레트로 삽입 (가장 확실)
1. 카드 노트 열기
2. `Ctrl + P`
3. **Templates: Insert template** 검색/선택
4. `prompt-card` 템플릿 선택

→ 템플릿 내용이 노트에 들어옵니다.

---

### 방법 B) 리본(사이드바) 버튼으로 삽입
1. **Settings → Appearance**
2. (옵션) “Insert template” 아이콘이 안 보이면  
   **Settings → Core plugins → Templates**가 켜져 있는지 확인
3. 카드 노트에서 템플릿 버튼 클릭 → 템플릿 선택

---

## 3) 카드 노트 작성 규칙 (DataviewJS용)

템플릿 삽입 후 아래만 채우면 됩니다:

- `title:` (필수)
- `date:` (필수, 정렬용)
- `image:` (필수, 갤러리 출력용)
- `prompt:` 또는 아래 코드블록 (둘 중 하나는 필수)

### 이미지 넣는 법
- 이미지를 노트에 드래그앤드롭하면 첨부됨  
- 첨부된 파일명을 `image:`에 그대로 넣기

예:
```md
image: TA-2026-02-13-22-28-12-Subject_Av-456500711-2.png
