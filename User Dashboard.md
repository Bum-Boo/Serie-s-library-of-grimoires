---
type: dashboard
status: active
created: 2026-06-11
updated: 2026-06-11
tags:
  - dashboard
  - personal
cssclasses:
  - dash-wide
banner: "[[Pasted image 20260206012601.png]]"
banner_icon: 🌙
dash_countdown_label: 다음 마일스톤까지
dash_countdown_date: 2026-08-31
summary: 힘멜이 보는 개인용 대시보드. 빠른 탐색 + 오늘/최근 작업 현황 + Spotify + TensorAI 갤러리 + 위젯.
related:
  - "[[운영_System/Bases_대시보드/Vault Dashboard]]"
---

<div class="dash-subtitle">Serie's Library of Grimoires · 개인 작업 허브</div>

<span class="dash-tagline">📌 [[운영_System/Vault Guide|Vault Guide 보기]]</span>
<span class="dash-tagline">⚙️ [[운영_System/Bases_대시보드/Vault Dashboard|관리용 대시보드]]</span>

> [!quote] When you feel like quitting, think about why you started.

## Quick Add

```button
name 📓 오늘 노트 열기
type command
action Daily notes: Open today's daily note
color blue
```
^quick-daily

```button
name 🆕 템플릿으로 새 노트
type command
action Templater: Create new note from template
color green
```
^quick-template

```button
name 🔍 빠른 전환
type command
action Quick switcher: Open quick switcher
color default
```
^quick-switch

## 바로가기 / Quick Links
<div class="dash-grid" markdown="1"><div markdown="1">

### 📥 Inbox
- [[수집_Inbox/Ideas_아이디어|Ideas]]
- [[수집_Inbox/WebClips_웹클립|WebClips]]
- [[수집_Inbox/ChatGPT_대화|ChatGPT 대화]]
- [[수집_Inbox/조사목록_ResearchQueue|조사목록]]

</div><div markdown="1">

### 📁 Projects
- [[프로젝트_Projects/graduate-school_대학원|대학원]]
- [[프로젝트_Projects/portfolio-site_포트폴리오|포트폴리오]]
- [[프로젝트_Projects/prestige_프레스티지|프레스티지]]
- [[프로젝트_Projects/image-converter_이미지변환|이미지변환]]
- [[프로젝트_Projects/obsidian-automation_옵시디언자동화|옵시디언자동화]]

</div><div markdown="1">

### 🧭 Areas
- [[영역_Areas/study_공부|공부]]
- [[영역_Areas/career_커리어|커리어]]
- [[영역_Areas/finance-business_금융비즈니스|금융비즈니스]]
- [[영역_Areas/market-analysis_시장분석|시장분석]]
- [[영역_Areas/ai-interactive-media_AI미디어|AI미디어]]

</div><div markdown="1">

### 📚 Sources / Knowledge
- [[자료_Sources/Articles_아티클|아티클]]
- [[자료_Sources/Papers_논문|논문]]
- [[자료_Sources/Books_책|책]]
- [[자료_Sources/Videos_영상|영상]]
- [[지식_Knowledge/Concepts_개념|개념]]
- [[지식_Knowledge/Questions_질문|질문]]

</div><div markdown="1">

### 🎨 Study / Play / Note
- [[Study/Index|Study]] · [[Study/Design/Index|Design]] · [[Study/Computer/Computer Index|Computer]] · [[Study/Branding/Index|Branding]]
- [[Play/Index|Play]] · [[Play/Book|Book]]
- [[Note/Index|Note]] · [[Note/Pop-up|Pop-up]] · [[Note/Planner|Planner]] · [[Note/Archive|Archive]]

</div><div markdown="1">

### ⚙️ System
- [[운영_System/Index|운영 시스템]]
- [[운영_System/Kanban_칸반/Hermes Grimoire Library Kanban|Hermes Kanban]]
- [[Obsidian/Rules_MD|Rules]] · [[Obsidian/CallOut|CallOut]]

</div></div>

## 오늘 할 일

```tasks
not done
(scheduled before tomorrow) OR (due before tomorrow) OR (no scheduled date AND no due date)
limit 10
```

## 메인 + 위젯
<div class="dash-layout" markdown="1"><div class="dash-main" markdown="1">

### 현황
<div class="dash-grid" markdown="1"><div markdown="1">

#### 오늘
```dataview
LIST
FROM "루틴_Periodic/Daily_일일"
WHERE date = date(today)
```

</div><div markdown="1">

#### 진행 중 프로젝트
```dataview
TABLE status, updated
FROM "프로젝트_Projects"
WHERE type = "project" AND status != "archived"
SORT updated DESC
```

</div><div class="dash-card-wide" markdown="1">

#### 최근 수정한 노트
```dataview
TABLE type, status, project, area, updated
FROM ""
WHERE !contains(file.path, "운영_System") AND !contains(file.path, ".trash")
SORT file.mtime DESC
LIMIT 10
```

</div><div class="dash-card-wide" markdown="1">

#### Inbox 처리 대기
```dataview
TABLE type, status, created
FROM "수집_Inbox"
WHERE status = "inbox" OR status = "to-process" OR !status
SORT created DESC
LIMIT 10
```

</div></div>

</div><div class="dash-side" markdown="1"><div class="dash-clock-widget" markdown="1">

```dataviewjs
const wrap = dv.el("div", "", {cls: "dash-clock-wrap"});
const time = wrap.createEl("div", {cls: "dash-clock"});
const date = wrap.createEl("div", {cls: "dash-clock-date"});
function tick() {
  const now = new Date();
  time.textContent = now.toLocaleTimeString("ko-KR", {hour: "2-digit", minute: "2-digit", second: "2-digit", hour12: false});
  date.textContent = now.toLocaleDateString("ko-KR", {year: "numeric", month: "long", day: "numeric", weekday: "long"});
}
tick();
const interval = setInterval(tick, 1000);
dv.component.register(() => clearInterval(interval));
```

</div><div class="dash-countdown" markdown="1">

```dataviewjs
const label = dv.current().dash_countdown_label ?? "D-Day";
const target = dv.date(dv.current().dash_countdown_date);
const wrap = dv.el("div", "", {});
const labelEl = wrap.createEl("div", {cls: "dash-countdown-label", text: "⏳ " + label});
const timeEl = wrap.createEl("div", {cls: "dash-countdown-time"});
function tick() {
  const diffMs = target.toMillis() - Date.now();
  if (diffMs <= 0) {
    timeEl.textContent = "도착!";
    return;
  }
  const sec = Math.floor(diffMs / 1000);
  const days = Math.floor(sec / 86400);
  const hours = Math.floor((sec % 86400) / 3600);
  const mins = Math.floor((sec % 3600) / 60);
  const secs = sec % 60;
  timeEl.textContent = `${days}일 ${hours}시간 ${mins}분 ${secs}초`;
}
tick();
const interval = setInterval(tick, 1000);
dv.component.register(() => clearInterval(interval));
```

</div><div class="dash-calendar" markdown="1">

```dataviewjs
const now = new Date();
const year = now.getFullYear();
const month = now.getMonth();
const today = now.getDate();
const wrap = dv.el("div", "");
wrap.createEl("div", {cls: "dash-cal-title", text: now.toLocaleDateString("ko-KR", {year: "numeric", month: "long"})});
const grid = wrap.createEl("div", {cls: "dash-cal-grid"});
["일","월","화","수","목","금","토"].forEach(d => grid.createEl("span", {cls: "dash-cal-head", text: d}));
const firstDay = new Date(year, month, 1).getDay();
const daysInMonth = new Date(year, month + 1, 0).getDate();
for (let i = 0; i < firstDay; i++) grid.createEl("span", {text: ""});
for (let d = 1; d <= daysInMonth; d++) {
  const mm = String(month + 1).padStart(2, "0");
  const dd = String(d).padStart(2, "0");
  const path = `루틴_Periodic/Daily_일일/${year}-${mm}-${dd}`;
  const a = grid.createEl("a", {text: String(d), cls: d === today ? "dash-cal-today" : ""});
  a.href = path;
  a.addEventListener("click", (e) => {
    e.preventDefault();
    app.workspace.openLinkText(path, "", false);
  });
}
```

</div><div class="dash-side-image" markdown="1">

![[Pasted image 20260205004319.png]]

</div><div class="dash-side-image" markdown="1">

![[Pasted image 20260121072742.png]]

</div></div></div>

## 🎵 Spotify
<div class="dash-grid" markdown="1"><div class="dash-card-wide dash-spotify" markdown="1">

<!-- 아래 src의 플레이리스트/앨범 링크를 본인 Spotify 링크로 교체 -->
<iframe style="border-radius:12px" src="https://open.spotify.com/embed/playlist/37i9dQZF1DXcBWIGoYBM5M?utm_source=generator" width="100%" height="152" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>

</div></div>

## 🖼️ TensorAI 갤러리
<div class="tensor-carousel" markdown="1">

```dataview
LIST WITHOUT ID embed(image)
FROM #ai_image
WHERE image AND contains(tags, "tensor_ai")
```

</div>

전체 보기: [[Study/Design/Ai Prompts/Gallary/TensorAi|TensorAI Gallery]]

## 프로젝트 빠른 이동

```tabs
tab: 대학원
```dataview
LIST
FROM "프로젝트_Projects/graduate-school_대학원"
SORT file.mtime DESC
LIMIT 10
```
tab: 포트폴리오
```dataview
LIST
FROM "프로젝트_Projects/portfolio-site_포트폴리오"
SORT file.mtime DESC
LIMIT 10
```
tab: 프레스티지
```dataview
LIST
FROM "프로젝트_Projects/prestige_프레스티지"
SORT file.mtime DESC
LIMIT 10
```
tab: 이미지변환
```dataview
LIST
FROM "프로젝트_Projects/image-converter_이미지변환"
SORT file.mtime DESC
LIMIT 10
```
tab: 옵시디언자동화
```dataview
LIST
FROM "프로젝트_Projects/obsidian-automation_옵시디언자동화"
SORT file.mtime DESC
LIMIT 10
```
```
</content>
