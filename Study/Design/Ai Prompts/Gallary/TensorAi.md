---
type: ai-image-gallery
status: active
created: 2026-06-04
updated: 2026-06-04
tags:
  - ai_image
  - tensor_ai
cssclasses:
  - cards
  - cards-readline-off
  - cards-image-only
---
````tabs

tab: Z-image-turbo

```dataview

TABLE WITHOUT ID
embed(image) AS "file.link"
FROM #ai_image
WHERE image
AND model = "z-image"
AND contains(tags, "ai_image")
AND contains(tags, "tensor_ai")


```
tab: Flux

```dataview

TABLE WITHOUT ID
embed(link(image)) AS ""
FROM #ai_image
WHERE image
AND model = "flux"
AND contains(tags, "ai_image")
AND contains(tags, "tensor_ai")

```

tab: Nano Banana

```dataview

TABLE WITHOUT ID
embed(link(image)) AS ""
FROM #ai_image
WHERE image
AND model = "nano_banana"
AND contains(tags, "ai_image")
AND contains(tags, "tensor_ai")
```
