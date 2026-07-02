# HTML in the vault (and viewing it in Obsidian)

`command` is markdown-first, but it's happy to hold **HTML files** too — and
that turns out to be one of its quietly powerful features.

## Why keep HTML in a folder of markdown?

Markdown is perfect for knowledge. But some things want to be *interactive*: a
dashboard, a chart (Plotly / D3), a knowledge-graph view, a one-page report you
can click around. Your AI can generate any of these as a **single self-contained
HTML file** and drop it right next to the markdown it came from.

This isn't a hack — it's where the world is going. Google's
[Open Knowledge Format](./open-knowledge-format.md) ships its reference graph
*visualizer* as exactly that: one self-contained HTML file, no backend, no
install, no data leaving the page. Same idea here. Keep the data in markdown;
let the AI render views of it as HTML when a picture beats a paragraph.

Good things to keep as HTML in the vault:

- A dashboard of a venture's metrics
- An interactive map/graph of your `wiki/`
- A slide deck or one-pager you generated for a pitch
- A chart built from a CSV in `inbox/data/`

## Can Obsidian display it?

**Markdown files (including `CLAUDE.md`):** yes, natively. They're just notes —
Obsidian opens and renders them like anything else.

**Static HTML written inline in a note:** yes, but Obsidian **sanitizes** it —
it strips `<script>`, so anything interactive won't *run* that way. Fine for
simple formatting, not for a live chart.

**A full interactive HTML file (your decks, an OKF visualizer):** Obsidian
won't render a standalone `.html` as a page on its own. Two easy fixes:

1. **Community plugin** — install **Local HTML Embed** or **Iframe Renderer**
   (both free), then embed it in a note with syntax like `!iframe[dashboard.html]`.
   It renders live in reading mode.
2. **Iframe to the file** — core Obsidian can embed web pages; point an
   `<iframe>` at the file and it loads.

Either way, you get the interactive artifact *inside* your vault, next to the
notes it belongs to.

## The takeaway

Don't think of this folder as "markdown only." Think of it as **plain text for
knowledge, HTML for views of that knowledge** — both living in the same place,
both generated and maintained by your AI.
