# CLAUDE.md — Command Center Schema

> This file is the **schema layer** for your unified command center — a Karpathy-style markdown + filesystem knowledge base built for a human captain plus a crew of AI agents.
>
> Claude (or any AI tool with filesystem access) reads this first to know where files go, how to navigate, and what operations are available.

---

## Structure

```
command/                                  ← your working folder + Obsidian vault (optional)
├── CLAUDE.md           ← You are here (schema layer — the rules of this room)
├── index.md            ← Machine-maintained catalog of wiki/ pages
├── log.md              ← Append-only activity log
│
├── raw/                ← IMMUTABLE source material (you add, AI reads, never edits in place)
│   ├── articles/       ← PDFs, research docs, web clips, agreements
│   ├── meeting-logs/   ← Meeting transcripts, voice notes
│   ├── uploads/        ← Files dropped here for AI context
│   ├── screenshots/    ← Screenshot destination
│   └── data/           ← CSVs, JSON exports, datasets
│
├── wiki/               ← AI-COMPILED knowledge (AI maintains, you review)
│   ├── ventures/       ← One entity page per venture you own
│   ├── clients/        ← One entity page per paid client
│   ├── people/         ← One entity page per person in your orbit
│   └── concepts/       ← Cross-cutting topics, syntheses, research notes
│
├── missions/           ← Thin files linking to your PM tool's tickets
├── calendar/           ← Daily notes, journal (human-authored)
├── atlas/              ← Navigation MOCs, dashboards, maps of the territory
├── templates/          ← Reusable templates (meeting notes, mission files, etc.)
│
├── ventures/           ← Code + ops (links to your venture git repos, project notes)
├── clients/            ← Client project files (private context, not client-shared deliverables)
├── tools/              ← Your reusable scripts and utilities
└── archive/            ← Deprecated, completed, or one-off material
```

---

## File Placement Decision Tree

When creating or saving a new file, follow this:

```
Is it source material (PDF, transcript, screenshot, CSV, raw doc)?
  → raw/  (pick the right subfolder: articles, meeting-logs, uploads, screenshots, data)

Is it compiled knowledge (summary, entity page, research synthesis)?
  → wiki/  (pick: ventures, clients, people, or concepts)

Is it a mission/project tracker (linked to your PM tool)?
  → missions/  (must link to a PM ticket)

Is it a daily note or journal entry?
  → calendar/

Is it a navigation/dashboard page?
  → atlas/

Is it code, scripts, or operational project files?
  → ventures/, clients/, or tools/

Is it old, done, or one-off?
  → archive/

None of the above?
  → Ask the captain where it should go.
```

**NEVER place new files at the repo root.** Only these files live at root: `CLAUDE.md`, `index.md`, `log.md`, `.gitignore`, dotfile configs.

**NEVER create new top-level directories without the captain's approval.** The set is fixed for a reason — it keeps the structure portable across machines, AI tools, and future-you.

---

## Four Operations (Karpathy Pattern)

### Ingest
When the captain adds new source material to `raw/`:
1. Read the new source.
2. Discuss key takeaways with the captain.
3. Create or update relevant `wiki/` pages (entity pages, concept pages).
4. Update `index.md` with new/changed wiki pages.
5. Append a log entry to `log.md`.

### Query
When the captain asks questions against the knowledge base:
1. Search relevant `wiki/` and `raw/` pages first.
2. Synthesize answer with citations to specific files.
3. If the answer produces valuable new knowledge, create a wiki page for it.

### Compile
Periodically rebuild or update wiki pages from raw sources:
1. Read from `raw/` (articles, meeting-logs, data).
2. Build/update structured `wiki/` pages — entity pages, concept syntheses.
3. Maintain cross-references with `[[wikilinks]]`.
4. Update `index.md`.

### Lint
Check structural health periodically:
1. Find files in wrong locations.
2. Find orphan files not in `index.md`.
3. Find stale wiki pages.
4. Find missions without PM-tool links.
5. Report issues with suggested fixes.

---

## index.md Maintenance

`index.md` is a machine-maintained catalog. Format:

```markdown
# Index
## wiki/ventures/
- example-venture.md — One-line description
## wiki/clients/
- example-client.md — One-line description
## wiki/concepts/
- example-concept.md — One-line description
## wiki/people/
- example-person.md — One-line description
```

Update `index.md` after every Ingest or Compile operation. Keep it under 200 lines — it's a catalog, not a dump.

---

## log.md Maintenance

Append-only. One line per operation:

```markdown
## [YYYY-MM-DD] operation | description
```

Example:

```markdown
## [2026-05-01] ingest | Added meeting transcript with potential client
## [2026-05-02] compile | Built venture entity page from raw sources
## [2026-05-03] query | Researched competitive landscape for new product
```

This becomes the captain's running narrative. AI agents read it to understand recent context.

---

## Missions Format

Each mission file is thin — your PM tool is the source of truth. The mission file holds context the PM tool doesn't:

```markdown
---
type: mission
pm_tool_id: PROJ-42
status: in-progress
---
# PROJ-42: Short description
[Open in PM tool](https://your-pm-tool.com/issue/PROJ-42)

## Notes
- Context not captured in PM tool goes here
- Decisions, links to relevant raw/ material, sketches, half-formed ideas
```

Replace `pm_tool_id` and the link with whatever PM tool you use (Linear, Todoist, Notion, etc.).

---

## Rules

These are non-negotiable. Hard-coded into how this room operates.

1. **Captain takes responsibility.** The buck stops at the captain. AI extends, never replaces, the captain's judgment.

2. **Secrets are sacred.** Never read, log, or commit `.env`, `.pem`, `.key`, credentials, tokens, or passwords. They live outside this repo (recommended: `~/<your-name>-secrets/` with `chmod 600`).

3. **No new files at root.** The root is reserved.

4. **No new top-level directories.** Add a new one only with explicit captain approval and a documented reason.

5. **Append-only for logs and decisions.** Never rewrite history. Old entries stay readable; new entries explain why something changed.

6. **AI quality = context quality.** If the AI is producing junior-level output, the diagnosis is almost always junior-level context. Improve the folder before blaming the model.

7. **Markdown first.** No proprietary formats for knowledge. Plain text in version control beats every "knowledge base SaaS" on the planet.

---

## How to extend this for your business

Customize without breaking the structure:

- **Add ventures:** create `ventures/<name>/` with `README.md` + `decisions.md` + `_links.md`
- **Add clients:** create `clients/<name>/` with the same shape plus `access-map.md` (who has what credentials)
- **Add wiki entities:** drop a markdown file in `wiki/people/`, `wiki/concepts/`, etc.
- **Add templates:** drop reusable patterns in `templates/`
- **Add tools:** put your scripts in `tools/`

What you SHOULDN'T do (without thinking):

- Don't add a new top-level folder. The set is fixed by design.
- Don't put credentials anywhere in this repo.
- Don't put project code here. Project code lives in its own git repos, linked from `ventures/<name>/_links.md`.

---

## Where this comes from

This pattern was developed by Max Palmer (founder of MaxShip) over years of running businesses where AI agents and human operators share the same knowledge base. It's influenced by:

- **Andrej Karpathy** — filesystem-as-AI-interface, structure-of-thought, LLM Wikis
- **Peter Naur** — *Programming as Theory Building* (1985). The captain's vision is the program; code is the shadow.
- **BAIR / DSPy / Stanford** — *The Shift from Models to Compound AI Systems* (Zaharia, Khattab et al., Feb 2024)
- **Interpreted Context Methodology (ICM)** — RinDig's open-source articulation
- **Karpathy's LLM Wiki concept** — personal knowledge base with AI as a continuous reader

If you want the full pedagogy + the Cloud and Bridge layers, that's MaxShip School: [shipwithmax.com](https://shipwithmax.com) (TKTK).

---

*Schema v0.1 · 2026-05-01*
