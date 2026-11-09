# wiki/

Compiled knowledge. AI maintains, you review.

This is where information from `inbox/` gets distilled into one-page-per-entity reference docs. The wiki is your business's Wikipedia — every venture, person, and concept gets one page. Cross-linked with `[[wikilinks]]`.

## Subfolders

- `ventures/` — One page per venture you own
- `people/` — One page per person in your orbit
- `concepts/` — Cross-cutting topics, syntheses, research notes

## Page template

Every page starts with frontmatter. These fields line up with Google's
[Open Knowledge Format](../docs/open-knowledge-format.md), so your wiki is a
valid OKF bundle out of the box:

```markdown
---
type: venture | person | concept
title: Page title
description: One-line summary of what this page is.
tags: [tag-a, tag-b]
status: active | paused | archived
timestamp: 2026-05-01T00:00:00Z
---

# Page title

One-paragraph summary.

## Key facts
- Bullet list of the most important things to remember

## Background
Longer prose. What happened, what's true, what's relevant.

## Cross-references
- [[other-page]]
- [[another-page]]

## Source material
- `inbox/articles/some-pdf.pdf`
- `inbox/meeting-logs/2026-04-15-call-with-x.md`
```

## When AI updates a wiki page

Always:
1. Preserve cross-references — never break wikilinks
2. Update `timestamp` in frontmatter
3. Append a log entry to `/log.md` describing what changed
4. Update `/index.md` if a new page was added

Optional: add `created-by: captain` or `created-by: agent`, so you can see at a
glance who started a page. A blank page to start from is in
[`templates/wiki-page.md`](../templates/wiki-page.md).

## Keep people pages factual

`wiki/people/` is about working relationships: role, what they own, what you
owe each other. Keep personal remarks and private details out, and keep
contact details in your contacts app. If you ever share or publish part of this
folder, leave `wiki/people/` out.
