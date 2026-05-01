# atlas/

Navigation maps and dashboards. Maps of the territory, not the territory itself.

Use this folder for:

- Top-level navigation pages — *"Everything I'm currently working on"*
- Cross-cutting dashboards — *"All my recurring revenue clients"*, *"All ventures by status"*
- MOCs (Maps of Content) — Obsidian-style index pages that link out to wiki entries
- Visualizations of how your business connects to itself

## Why a separate folder

`atlas/` files don't belong in `wiki/` because they're not entity pages — they're meta-pages. Their purpose is to *route the reader* (or the AI) to the actual entity pages.

## Example

```markdown
# All Active Engagements

## Ventures (mine)
- [[venture-a]] — building, Q3 launch
- [[venture-b]] — paused

## Clients (paid)
- [[client-x]] — active retainer
- [[client-y]] — project-based

## Co-owned (equity / partnership)
- [[co-owned-thing]]
```

Links via `[[wikilinks]]` so Obsidian renders the graph.
