---
type: system-guide
status: active
created: 2026-06-04
updated: 2026-06-04
tags:
  - system
  - obsidian
---
# Vault Guide

## Purpose

이 vault는 정보를 복잡하게 보관하기보다 나중에 다시 찾고, 프로젝트와 연구에 바로 쓸 수 있게 정리하는 시스템이다.

Use simple Markdown notes, stable YAML properties, internal links, and periodic synthesis.

## Folder Roles

Folder names use the `한국어_English` pattern. Keep the Korean role first for quick scanning, keep the English role for compatibility, and use Iconize folder icons instead of numeric prefixes for visual grouping.

- `운영_System/`: templates, taxonomy, dashboard notes, scripts.
- `수집_Inbox/`: unprocessed captures, ChatGPT logs, raw ideas, web clips.
- `루틴_Periodic/`: daily, weekly, monthly, quarterly reviews.
- `프로젝트_Projects/`: active project materials and decisions.
- `영역_Areas/`: ongoing responsibility areas and long-term themes.
- `지식_Knowledge/`: reusable concepts, people, organizations, technologies, methods, questions.
- `자료_Sources/`: articles, papers, reports, datasets, books, videos.
- `결과물_Outputs/`: essays, reports, presentations, product ideas, research proposals.
- `보관_Archive/`: inactive material preserved for reference.

Folder icons are managed by the Iconize plugin in `.obsidian/plugins/obsidian-icon-folder/data.json`.

## Capture Flow

1. Put new material in `수집_Inbox/`.
2. Add minimal YAML: `type`, `status`, `created`, `tags`.
3. Summarize the note in 3-5 bullets when possible.
4. Link it to a project, area, source, or concept.
5. Move or copy synthesized output into the right project, knowledge, or output folder later.

## Review Flow

- Weekly: extract decisions, tasks, questions, and useful links from inbox/project notes.
- Monthly: identify repeated themes, project progress, and research directions.
- Quarterly: archive inactive work and update the taxonomy if retrieval is becoming hard.
