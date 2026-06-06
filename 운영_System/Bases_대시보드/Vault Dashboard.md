---
type: dashboard
status: active
created: 2026-06-04
updated: 2026-06-04
tags:
  - system
  - dashboard
---
# Vault Dashboard

This dashboard is Dataview-compatible. If Dataview is not enabled, the queries remain readable as maintenance checklists.

## Inbox To Process

```dataview
TABLE type, status, project, area, created, updated
FROM "수집_Inbox"
WHERE status = "inbox" OR status = "to-process" OR !status
SORT created DESC
LIMIT 30
```

## Active Projects

```dataview
TABLE status, updated, summary
FROM "프로젝트_Projects"
WHERE type = "project" AND status != "archived"
SORT updated DESC
```

## Sources To Read

```dataview
TABLE source_type, author, published, status, topics
FROM "자료_Sources" OR "Study"
WHERE type = "source" AND (status = "to-process" OR status = "inbox" OR status = "reading" OR status = "active")
SORT created DESC
LIMIT 30
```

## Recent Notes

```dataview
TABLE type, status, area, project, topics, updated
FROM "Study" OR "Note" OR "Play" OR "Obsidian"
WHERE type AND status
SORT updated DESC
LIMIT 30
```

## Metadata Watchlist

```dataview
TABLE status, type, file.folder
FROM ""
WHERE !type OR !status OR !created OR !updated
SORT file.path ASC
LIMIT 50
```

## Open Questions

```dataview
TABLE area, project, status, updated
FROM "지식_Knowledge/Questions_질문"
WHERE status != "done" AND status != "archived"
SORT updated DESC
```

## Recent Outputs

```dataview
TABLE type, status, project, area, updated
FROM "결과물_Outputs"
SORT updated DESC
LIMIT 20
```
