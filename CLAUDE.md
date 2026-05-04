# CLAUDE.md — Command Center Schema

> The schema layer for `command` — a markdown + filesystem knowledge base built for a human captain plus a crew of AI agents.
>
> Claude (or any AI tool with filesystem access) reads this first to know where files go, how to navigate, and what operations are available.

---

## Memory model (Anthropic, March 2026+)

This folder works with Anthropic's three-layer memory system:

- **`CLAUDE.md`** (this file) — explicit instructions, routing rules, "how the captain wants things done." Authored by you. Brief, opinionated, high-signal. **Not a knowledge dump.**
- **`MEMORY.md`** (next to this file) — auto-memory, maintained by Claude. Captures patterns and preferences Claude learns from working with you. Loads first 200 lines at session start.
- **Chat memory** — cross-session conversation context surfaced by Claude when relevant. Lives in Anthropic's backend.

**Critical:** Routing rules belong here in `CLAUDE.md`. Observed learnings belong in `MEMORY.md`. Don't dump everything you know into either file. The folder structure below holds the bulk of context — these two files are just the operating manual on top.

---

## Structure

```
command/                                  ← your working folder + Obsidian vault
├── CLAUDE.md           ← You are here (schema layer — captain authors)
├── MEMORY.md           ← Auto-memory (Claude maintains)
├── index.md            ← Machine-maintained catalog of wiki/ pages
├── log.md              ← Append-only activity log — one line per operation
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
│   └── concepts/       ← Cross-cutting topics, syntheses, research
│
├── missions/           ← Thin files linking to your PM tool's tickets
├── atlas/              ← Navigation maps + dashboards (MOCs)
├── templates/          ← Reusable templates (meeting notes, mission files, etc.)
│
├── ventures/           ← Code links + ops + decisions per venture you own
├── clients/            ← Paid engagement files (private context, not deliverables)
├── tools/              ← Reusable scripts, utilities, custom AI skills, MCP integrations
└── archive/            ← Deprecated, completed, or one-off material
```

**Note on `log.md` vs the rest of the folder:** `log.md` is a single root-level file holding a one-line, append-only timeline of operations. It's the captain's running narrative — machine-readable, dated, dense. If you want longer-form journaling, put it in `wiki/concepts/journal/` or `atlas/`. Keep `log.md` lean.

---

## File Placement Decision Tree

When creating or saving a new file:

```
Is it source material (PDF, transcript, screenshot, CSV, raw doc)?
  → raw/  (pick the right subfolder: articles, meeting-logs, uploads, screenshots, data)

Is it compiled knowledge (summary, entity page, research synthesis)?
  → wiki/  (pick: ventures, clients, people, or concepts)

Is it a mission/project tracker (linked to your PM tool)?
  → missions/  (must link to a PM ticket)

Is it a navigation/dashboard page or map of content?
  → atlas/

Is it code, scripts, or operational project files?
  → ventures/ (yours), clients/ (paid), or tools/ (reusable)

Is it old, done, or one-off?
  → archive/

None of the above?
  → Ask the captain where it should go.
```

**NEVER place new files at the repo root.** Only these files live at root: `CLAUDE.md`, `index.md`, `log.md`, `.gitignore`, dotfile configs.

**NEVER create new top-level directories without the captain's approval.** The set is fixed for a reason — it keeps the structure portable across machines, AI tools, and future-you.

---

## The four core operations (Karpathy pattern)

### Ingest
When the captain adds new source material to `raw/`:
1. Read the new source.
2. Discuss key takeaways with the captain.
3. Create or update relevant `wiki/` pages (entity pages, concept pages).
4. Update `index.md` with new/changed wiki pages.
5. Append a log entry to `log.md`.

### Query
When the captain asks a question against the knowledge base:
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

## Skills — invokable workflows

`command` ships with **Claude Skills** in `tools/skills/`. Each skill is a self-contained workflow Claude can invoke when the captain asks for it. Read `tools/skills/<skill-name>/SKILL.md` to know what a skill does and how to execute it.

The captain invokes a skill by phrasing — *"run the X skill"*, *"use X to do Y"*, or just describing the task. Match the closest skill from `tools/skills/` and follow the SKILL.md instructions step-by-step.

**Shipped:**
- `command-init` — bootstrap a venture folder (asks 4 questions, creates `ventures/<slug>/` + wiki entry + log line + index update)

**Roadmap (later versions):** `client-init`, `ingest-meeting`, `daily-brief`, `lint-folder`, `deploy-worker`. See `tools/skills/README.md` for the full list and how to write your own.

---

## The three operator extensions

`command` is built for shipping, not just note-taking. These three operations sit alongside the Karpathy four:

### Build
The captain says *"build me a thing."* The AI tool reads `CLAUDE.md` + relevant `wiki/` pages, then:
1. Drops scripts in `tools/` or scaffolds a new venture in `ventures/<name>/`.
2. Writes a `decisions.md` entry capturing what was built and why.
3. Logs to `log.md`.

### Deploy
For Cloud-side artifacts (Cloudflare Workers, scheduled jobs, custom MCPs):
1. AI executes deploy from inside the folder (`wrangler deploy`, `gh deploy`, etc.).
2. Captures the live URL or status in the relevant `ventures/<name>/_links.md`.
3. Logs to `log.md` with the deploy timestamp.

### Integrate
For external services (Linear, Notion, GitHub, your CRM, Cloudflare D1):
1. Reference integration patterns live in `tools/integrations/`.
2. MCPs live in `tools/mcps/` (or installed via your AI tool's MCP config).
3. APIs and SDKs are documented in `wiki/concepts/integrations.md`.
4. Secrets stay outside the repo (see `## Rules` below).

---

## Three integration patterns — when to use which

The folder talks to the world through three patterns:

| Pattern | When to use | Example |
|---|---|---|
| **MCP** (Model Context Protocol) | When you want the AI to **act** on a service (read, write, query) interactively or in a workflow. | Cloudflare MCP for deploys. GitHub MCP for repo navigation. Linear MCP for ticket creation. |
| **API** | When you want **deterministic** machine-to-machine calls — scheduled jobs, webhooks, server-to-server. | Cloudflare Worker calls Resend API to send email. Cron job calls OpenAI API to summarize yesterday's `log.md`. |
| **SDK** | When you want **richer** programmatic control or local-first tools. | Anthropic SDK in a `tools/` script. GitHub SDK in a deploy helper. |

Most operations work fine with just MCPs. Reach for APIs when you need scheduled or deterministic. Reach for SDKs when you're building a tool that bundles multiple service calls.

---

## Secrets handling — non-negotiable

**Secrets never live inside this repo.** Period. The `.gitignore` blocks common patterns (`.env`, `*.pem`, `*.key`, `credentials*`, `secrets*`) but those are safety nets, not the contract.

The contract:

```
~/<your-secrets>/                       (chmod 700, owner-only)
├── README.md                            (chmod 644 — public docs are fine)
├── secrets.env                          (chmod 600 — owner-only)
└── .gitignore                           (chmod 600 — ignores everything)
```

Then load secrets via shell substitution at the moment of use:

```bash
export ANTHROPIC_API_KEY=$(grep '^ANTHROPIC_API_KEY=' ~/<your-secrets>/secrets.env | cut -d'=' -f2-)
```

Never `cat` or `echo` secrets in a way that lands them in a transcript, log, or AI conversation. Treat every API key like a password — because it is one.

---

## index.md maintenance

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
- example-person.md — Role + relationship
```

Update `index.md` after every Ingest or Compile operation. Keep it under 200 lines — it's a catalog, not a dump.

---

## log.md maintenance

Append-only. One line per operation:

```markdown
## [YYYY-MM-DD] operation | description
```

Operations: `ingest` · `query` · `compile` · `lint` · `decision` · `ship` · `build` · `deploy` · `integrate`

Example:

```markdown
## [2026-05-01] ingest | Added meeting transcript with potential client
## [2026-05-02] compile | Built venture entity page from raw sources
## [2026-05-03] deploy | Pushed v0.3 of api-worker to Cloudflare
## [2026-05-04] decision | Chose Cloudflare D1 over Postgres for low-traffic project
```

This becomes the captain's running narrative. AI agents read it to understand recent context. Newest entries at the top OR the bottom — pick one and stay consistent (most operators do bottom = newest, like a journal).

---

## Missions format

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

## Rules — non-negotiable

1. **Captain takes responsibility.** The buck stops at the captain. AI extends, never replaces, the captain's judgment.

2. **Secrets are sacred.** Never read, log, or commit `.env`, `.pem`, `.key`, credentials, tokens, or passwords. They live outside this repo (see secrets handling section above).

3. **No new files at root.** The root is reserved.

4. **No new top-level directories.** Add a new one only with explicit captain approval and a documented reason in `decisions.md`.

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
- **Add tools:** put your scripts in `tools/`. Claude Skills in `tools/skills/<skill-name>/SKILL.md`. MCPs in `tools/mcps/`. Integrations in `tools/integrations/`.

What you SHOULDN'T do (without thinking):

- Don't add a new top-level folder. The set is fixed by design.
- Don't put credentials anywhere in this repo.
- Don't put project code here. Project code lives in its own git repos, linked from `ventures/<name>/_links.md`.

---

## Where this comes from

This pattern is built on:

- **Andrej Karpathy** — filesystem-as-AI-interface, structure-of-thought, LLM Wikis. The four core operations originated with this thinking.
- **Peter Naur** — *Programming as Theory Building* (1985). The captain's vision is the program; code is the shadow.
- **BAIR / DSPy / Stanford** — *The Shift from Models to Compound AI Systems* (Zaharia, Khattab et al., Feb 2024).
- **Anthropic Engineering** — *"the folder and file structure of an agent becomes a form of context engineering."*
- **Naval Ravikant** — *code is the most powerful form of permissionless leverage.*

The full operating model — Command (this folder) + Compute (deployed infrastructure) + Cycle (the daily practice that compounds) — is taught at [max-ship.com](https://max-ship.com).

---

*Schema v0.2 · MIT*
