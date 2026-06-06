---
type: taxonomy
status: active
created: 2026-06-04
updated: 2026-06-04
tags:
  - system
  - metadata
  - taxonomy
---
# Metadata Schema

Use these fields when they help retrieval. Do not force every field into every note.

## Standard Fields

```yaml
---
type:
status:
created:
updated:
project:
area:
source_type:
topics:
tags:
summary:
related:
---
```

## Recommended Values

`type`

- `note`
- `index`
- `template`
- `system-note`
- `system-guide`
- `system-index`
- `dashboard`
- `taxonomy`
- `chatgpt-log`
- `web-clip`
- `idea`
- `project`
- `source`
- `concept`
- `person`
- `organization`
- `technology`
- `method`
- `question`
- `daily-review`
- `weekly-review`
- `monthly-review`
- `output`
- `ai-image`
- `ai-image-gallery`

`status`

- `inbox`
- `to-process`
- `active`
- `draft`
- `evergreen`
- `reading`
- `waiting`
- `done`
- `archived`

`source_type`

- `article`
- `paper`
- `book`
- `video`
- `report`
- `dataset`
- `conversation`

## Minimal Frontmatter

For fast capture:

```yaml
---
type: note
status: inbox
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: []
---
```

For source notes:

```yaml
---
type: source
status: to-process
source_type: article
created: YYYY-MM-DD
updated: YYYY-MM-DD
author:
url:
published:
topics: []
tags: []
summary:
related: []
---
```
