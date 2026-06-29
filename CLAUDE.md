# CLAUDE.md — how to help me run my business

> You (Claude, or any AI with file access) read this first, every session. It
> tells you what this folder is, where things go, and how to help. The person
> who owns this folder is the **captain** — they make the calls; you extend their
> judgment, you don't replace it. Talk plainly. Assume no jargon.

---

## What this folder is

A plain-text knowledge base — the brain of the captain's business. Everything
lives here as markdown: ideas, research, decisions, projects, people. Your job is
to help the captain **capture** things into it, **answer** questions from it, and
**keep it organized** as it grows.

The captain mostly just talks to you. Your job is to put what they say in the
right place, and to read the folder before you answer so you respond as someone
who knows their whole business — not a stranger starting cold.

---

## The structure

```
command/                 ← the working folder + Obsidian vault
├── CLAUDE.md            ← you are here (how to help — captain authors)
├── MEMORY.md            ← what you've learned about how the captain works (you maintain)
├── index.md             ← catalog of wiki/ pages
├── log.md               ← one line per operation, append-only
│
├── inbox/               ← EVERYTHING lands here first (captures, transcripts, PDFs, screenshots)
├── wiki/                ← clean compiled knowledge (you maintain, captain reviews)
│   ├── ventures/        ← one page per venture the captain owns
│   ├── people/          ← one page per person in their orbit
│   └── concepts/        ← cross-cutting topics, syntheses, research
│
├── ventures/            ← things the captain owns — notes, decisions, links per project
├── missions/            ← thin files linking to PM-tool tickets (Linear/Todoist/Notion)
├── strategy/            ← objectives, quarterly rocks, annual themes
├── cadence/             ← daily/weekly/monthly/quarterly/yearly rhythms
├── atlas/               ← maps + dashboards that point to everything
├── templates/           ← reusable patterns
├── compute/             ← what's actually running (stack + automations)
├── tools/               ← reusable scripts + AI skills
└── archive/             ← done / parked
```

---

## Where new files go

```
Source material (PDF, transcript, screenshot, CSV, a rough note)?
  → inbox/   (it can be sorted into wiki/ later)

Compiled knowledge (a clean summary, an entity page, a research synthesis)?
  → wiki/    (ventures, people, or concepts)

A project/to-do tracker linked to the captain's PM tool?
  → missions/   (link the PM ticket)

A navigation/dashboard page or map?
  → atlas/

Code, scripts, ops notes for a project the captain owns?
  → ventures/ (that project)  or  tools/ (reusable)

Old, done, or one-off?
  → archive/

Not sure?
  → inbox/, and tell the captain you did. Never lose a capture.
```

**Never** create files at the repo root (only `CLAUDE.md`, `MEMORY.md`,
`index.md`, `log.md`, dotfiles live there). **Never** add a new top-level folder
without the captain's OK — the set is fixed so the structure stays portable.

---

## How to behave — the core loop

**1. When the captain tells you something worth keeping, save it — then confirm
in one line.** *"Saved to inbox/2026-06-29-app-idea.md."*

**2. When they ask what they know, read the folder and answer from it** — search
`wiki/` and `inbox/` first, cite the files, and say so if something isn't written
down yet. Don't answer from guesswork.

**3. Process the inbox on request.** *"Process my inbox"* → read what's new,
distill it into `wiki/` pages, update `index.md`, append a line to `log.md`, and
report what you did.

**4. Keep the running record honest.** Decisions and `log.md` are **append-only**
— add entries, never rewrite history. Status (a venture's "current state") is
**updated in place**.

**5. Dates are real dates.** Convert "yesterday" / "last week" to `YYYY-MM-DD`
before writing.

---

## The four core operations (Karpathy pattern)

The named version of the loop above — use these when the captain refers to them:

- **Ingest** — new material in `inbox/` → discuss takeaways → update `wiki/` → update `index.md` → log it.
- **Query** — a question → search `wiki/` + `inbox/` → answer with citations → capture new knowledge if valuable.
- **Compile** — rebuild `wiki/` pages from `inbox/` sources, maintain `[[wikilinks]]`, update `index.md`.
- **Lint** — health check: files in wrong places, orphan pages, stale entries. Report with fixes.

When the captain wants the folder to *do* things — build a script, deploy a
Worker, connect another tool — read [`docs/advanced.md`](./docs/advanced.md) for
the Build / Deploy / Integrate operations and the MCP/API/SDK patterns.

---

## Skills — invokable workflows

`command` ships **Claude Skills** in `tools/skills/`. When the captain says "run
the X skill" (or just describes a task that matches one), read
`tools/skills/<name>/SKILL.md` and follow it step by step.

**Shipped:** `command-init` — bootstrap a venture (asks a few questions, creates
`ventures/<slug>/` + a wiki entry + a log line + index update).

---

## Memory model (Anthropic, three layers)

- **`CLAUDE.md`** (this file) — explicit instructions and routing rules the captain authors. Brief, opinionated. **Not a knowledge dump.**
- **`MEMORY.md`** — patterns *you* observe about how the captain works. You maintain it.
- **Chat memory** — cross-session context surfaced when relevant.

Routing rules belong here. Observations belong in `MEMORY.md`. Don't conflate the
two. The folder structure holds the bulk of context — these files are just the
operating manual on top.

---

## Rules — non-negotiable

1. **The captain takes responsibility.** You extend their judgment, never replace it.
2. **Secrets are sacred.** Never read, log, or commit `.env`, `*.pem`, `*.key`, credentials, tokens, or passwords. They live *outside* this folder. Full rule: [`docs/secrets.md`](./docs/secrets.md).
3. **No new files at root. No new top-level folders** without explicit approval.
4. **Append-only for `log.md` and decisions.** Never rewrite history.
5. **AI quality = context quality.** If your output feels junior, the fix is usually better context in the folder — improve the folder before blaming the model.
6. **Markdown first.** Plain text in version control beats every knowledge-base SaaS.

---

## OKF-compatible by design

This folder follows the same shape as Google's
[Open Knowledge Format](./docs/open-knowledge-format.md): markdown + light YAML
frontmatter, linked into a graph, with `index.md` and `log.md`. Keep `wiki/` page
frontmatter aligned (`type`, `title`, `description`, `tags`, `timestamp`) so the
vault stays a valid OKF bundle.

---

## Going deeper

- [`docs/advanced.md`](./docs/advanced.md) — Build/Deploy/Integrate, MCP/API/SDK, missions, `index.md`/`log.md` detail.
- [`docs/secrets.md`](./docs/secrets.md) — credential handling.
- [`docs/frameworks.md`](./docs/frameworks.md) — PARA · PPV · Karpathy · OKF.
- [`docs/open-knowledge-format.md`](./docs/open-knowledge-format.md) — the OKF mapping.
- [`docs/html-in-the-vault.md`](./docs/html-in-the-vault.md) — interactive HTML beside your markdown.

---

*Schema v0.4 · MIT · the full Command · Compute · Cadence model is taught at [max-ship.com](https://max-ship.com)*
