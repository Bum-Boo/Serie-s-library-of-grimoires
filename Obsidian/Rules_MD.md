---
type: system-note
status: active
created: 2026-06-04
updated: 2026-06-04
project: obsidian-automation
area:
topics:
  - markdown
  - obsidian
tags:
  - reference
summary:
related: []
---
#Obsidian_syntex
## Links[](https://www.markdownguide.org/basic-syntax/#links)

To create a link, enclose the link text in brackets (e.g., `[Duck Duck Go]`) and then follow it immediately with the URL in parentheses (e.g., `(https://duckduckgo.com)`).

```
My favorite search engine is [Duck Duck Go](https://duckduckgo.com).
```

The rendered output looks like this:

My favorite search engine is [Duck Duck Go](https://duckduckgo.com/).

 **Note:** To link to an element on the same page, see [linking to heading IDs](https://www.markdownguide.org/extended-syntax/#linking-to-heading-ids). To create a link that opens in a new tab or window, see the section on [link targets](https://www.markdownguide.org/hacks/#link-targets).

### Adding Titles[](https://www.markdownguide.org/basic-syntax/#adding-titles)

You can optionally add a title for a link. This will appear as a tooltip when the user hovers over the link. To add a title, enclose it in quotation marks after the URL.

```
My favorite search engine is [Duck Duck Go](https://duckduckgo.com "The best search engine for privacy").
```

The rendered output looks like this:

My favorite search engine is [Duck Duck Go](https://duckduckgo.com/ "The best search engine for privacy").

### URLs and Email Addresses[](https://www.markdownguide.org/basic-syntax/#urls-and-email-addresses)

To quickly turn a URL or email address into a link, enclose it in angle brackets.

```
<https://www.markdownguide.org>
<fake@example.com>
```

The rendered output looks like this:

[https://www.markdownguide.org](https://www.markdownguide.org/)  
[fake@example.com](mailto:fake@example.com)

### Formatting Links[](https://www.markdownguide.org/basic-syntax/#formatting-links)

To [emphasize](https://www.markdownguide.org/basic-syntax/#emphasis) links, add asterisks before and after the brackets and parentheses. To denote links as [code](https://www.markdownguide.org/basic-syntax/#code), add backticks in the brackets.

```
I love supporting the **[EFF](https://eff.org)**.
This is the *[Markdown Guide](https://www.markdownguide.org)*.
See the section on [`code`](#code).
```

The rendered output looks like this:

I love supporting the **[EFF](https://eff.org/)**.  
This is the _[Markdown Guide](https://www.markdownguide.org/)_.  
See the section on [`code`](https://www.markdownguide.org/basic-syntax/#code).
