# atlas/

Navigation maps and dashboards. Maps of the territory, not the territory itself.

Use this folder for:

- Top-level navigation pages — *"Everything I'm currently working on"*
- Cross-cutting dashboards — *"All ventures by status"*, *"Every idea I'm still validating"*
- MOCs (Maps of Content) — Obsidian-style index pages that link out to wiki entries
- Visualizations of how your business connects to itself
- **`handoff.md`**: tonight's note to tomorrow. The `shutdown` skill overwrites it each evening, and the `daily-brief` skill reads it first each morning. One screen: first block, where things stand, who you're waiting on, what not to forget.

## Why a separate folder

`atlas/` files don't belong in `wiki/` because they're not entity pages — they're meta-pages. Their purpose is to *route the reader* (or the AI) to the actual entity pages.

## Example

```markdown
# All Active Engagements

## Ventures (mine)
- [[venture-a]] — building, Q3 launch
- [[venture-b]] — paused

## Ideas (still validating)
- [[idea-x]] — running a waitlist test
- [[idea-y]] — researching the market

## Co-owned (equity / partnership)
- [[co-owned-thing]]
```

Links via `[[wikilinks]]` so Obsidian renders the graph.
