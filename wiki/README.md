# wiki/

Compiled knowledge. AI maintains, you review.

This is where information from `raw/` gets distilled into one-page-per-entity reference docs. The wiki is your business's Wikipedia — every venture, client, person, and concept gets one page. Cross-linked with `[[wikilinks]]`.

## Subfolders

- `ventures/` — One page per venture you own
- `clients/` — One page per paid client
- `people/` — One page per person in your orbit
- `concepts/` — Cross-cutting topics, syntheses, research notes

## Page template

Every page starts with frontmatter:

```markdown
---
type: venture | client | person | concept
status: active | paused | archived
last_updated: 2026-05-01
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
- `raw/articles/some-pdf.pdf`
- `raw/meeting-logs/2026-04-15-call-with-x.md`
```

## When AI updates a wiki page

Always:
1. Preserve cross-references — never break wikilinks
2. Update `last_updated` in frontmatter
3. Append a log entry to `/log.md` describing what changed
4. Update `/index.md` if a new page was added
