# `command` and Google's Open Knowledge Format (OKF)

On **June 13, 2026**, Google Cloud's Data team published the
[Open Knowledge Format (OKF)](https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing)
— "a vendor-neutral, agent- and human-friendly standard for representing the
metadata, context, and curated knowledge that modern AI systems need."

If that sounds familiar, it should. It's the same bet `command` is built on,
now formalized as an open standard by Google.

## What OKF is

OKF v0.1 represents a body of knowledge as:

- **Just markdown** — readable in any editor, renderable on GitHub, indexable by any tool.
- **Just files** — a directory you can ship as a tarball, host in any git repo, mount on any filesystem.
- **Just YAML frontmatter** — a small set of fields: `type`, `title`, `description`, `resource`, `tags`, `timestamp`.

Concepts link to each other with **normal markdown links**, which turns the
directory into a graph of relationships richer than the folder hierarchy.
Bundles optionally include `index.md` files (progressive disclosure) and
`log.md` files (chronological change history).

It is explicitly open: *"not tied to any specific cloud, database, model
provider, or agent framework. It will never require a proprietary account or SDK
to read, write, or serve."*

Google also shipped a **static HTML visualizer** that turns any OKF bundle into
an interactive graph view in a single self-contained file — "no backend, no
install on the viewing side, no data leaves the page."

## Why this matters for you

You didn't adopt a fad. You adopted the pattern that a major cloud just turned
into an interoperable standard. The format your business lives in is now one
that more and more tools will read and write natively.

`command` already converged on the same shape — it has had `index.md` and
`log.md` since before OKF existed. The only change we made to be a clean OKF
bundle was to line up the wiki frontmatter fields.

## How `command` maps to OKF

| OKF | `command` |
|---|---|
| Directory of markdown files | The whole folder |
| YAML frontmatter (`type`, `title`, `description`, `tags`, `timestamp`) | `wiki/` page frontmatter (see `wiki/README.md`) |
| Markdown links forming a graph | `[[wikilinks]]` across `wiki/` and `atlas/` |
| `index.md` (progressive disclosure) | `index.md` at root |
| `log.md` (change history) | `log.md` at root |

Your `wiki/` is effectively an OKF bundle. That means you can point any
OKF-aware tool — including Google's HTML graph visualizer — at it and get an
interactive map of your business for free.

## The HTML visualizer angle

OKF's reference visualizer is a single self-contained HTML file that renders
your knowledge graph. This is the same reason `command` is comfortable holding
HTML files in the vault: an interactive artifact (a dashboard, a chart, a graph
view) can live right next to the markdown it describes, and your AI can generate
it on demand. See [`docs/html-in-the-vault.md`](./html-in-the-vault.md).

## Source

- Google Cloud — [How the Open Knowledge Format can improve data sharing](https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing)
- Spec on GitHub: `GoogleCloudPlatform/knowledge-catalog/tree/main/okf`
