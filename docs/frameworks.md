# What `command` is built on

`command` isn't a new idea. It's a synthesis of four proven ones, aimed
specifically at a solo operator running a business with AI. If you want to go
deeper on the thinking, start here.

## 1. PARA — Tiago Forte

[PARA](https://fortelabs.com/blog/para/) organizes everything you keep into four
buckets: **Projects, Areas, Resources, Archives.** Its core insight is to
organize by *actionability*, not by topic — how soon and how directly something
will be used.

**In `command`:** `ventures/` and `missions/` are your Projects; `cadence/` and
`strategy/` are your Areas; `wiki/` and `inbox/` are your Resources; `archive/`
is Archives. Same instinct — organize by what you'll *do* with it.

## 2. PPV (Pipelines, Pillars, Vaults) — August Bradley

[August Bradley's PPV](https://www.youtube.com/@augustbradley) is a
"life operating system" built in Notion. Its big contribution is **the system as
a connected machine**, not a pile of notes: typed databases that relate to each
other, with cadences (daily/weekly/quarterly) driving review and prioritization.

**In `command`:** the `cadence/` folder is pure PPV — the daily/weekly/monthly/
quarterly/yearly rhythms that keep the system *alive* instead of letting it rot.
The wiki's typed, cross-linked entity pages are the markdown-native version of
PPV's relational databases.

## 3. The LLM filesystem — Andrej Karpathy

[Andrej Karpathy's](https://karpathy.ai) insight: a folder of markdown is a
great interface *for an AI*. Point a model at structured files and it navigates
to the right context on its own — your prompts get shorter and the output gets
better. The four operations **Ingest · Query · Compile · Lint** come from this
thinking. This is the lever the whole approach turns on.

**In `command`:** the entire premise. The folder is the AI's senior context.
`CLAUDE.md` is the contract; the structure is what makes "point your AI at it
and just talk" actually work.

## 4. Open Knowledge Format (OKF) — Google, June 2026

The newest of the four, and the one that proves the others were right.
[Google's OKF](https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing)
is a vendor-neutral open standard: a body of knowledge as a directory of
markdown files with light YAML frontmatter, linked into a graph, with `index.md`
and `log.md` conventions. It's PARA's actionability + Karpathy's filesystem,
turned into an interoperable spec — and shipped with an HTML graph visualizer.

**In `command`:** your `wiki/` is a valid OKF bundle. See
[`docs/open-knowledge-format.md`](./open-knowledge-format.md).

---

## The one-line version

> **PARA** taught us how to organize. **PPV** taught us to run it as a living
> machine on a cadence. **Karpathy** showed the folder is the best interface for
> an AI. **OKF** made it an open standard. `command` is those four, pointed at
> one solo operator shipping real work with an AI crew.
