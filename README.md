# command

> **A folder you build your business out of. Open-source. AI-readable. Yours to fork.**

`command` is a plain-text folder that becomes the **brain of your business** —
the one place your ideas, research, decisions, and projects live, in a shape your
AI can read and write alongside you. One human in charge. A crew of AI agents.
The same folder you both navigate.

You don't need to be technical. If you can keep files in folders, you can run this.

---

## Start here — the 60-second version

Every "AI productivity" app owns your data and resets when the company pivots.
And every time you prompt a fresh AI, you re-explain your whole business from
scratch.

`command` fixes both with one move: **put your business in a folder, give the
folder a shape, and point your AI at it.** Once your AI can navigate to the right
context on its own, your prompts get shorter and the answers get dramatically
better — across every model.

That's the whole idea. The folder is the memory your AI thinks with.

---

## What you actually do with it

Three moves. That's the entire skill — you just talk to your AI:

1. **Capture** → drop anything (a thought, a transcript, a PDF, a screenshot)
   into `inbox/`. *"Save this."*
2. **Ask** → question your own business. *"What do I know about X?" / "What did I
   decide about Y, and why?"* Your AI reads the folder and answers.
3. **Let it tidy** → your AI turns raw captures into clean `wiki/` pages, logs
   what changed, and keeps the structure in order. *"Process my inbox."*

You think and decide. The folder remembers. The AI keeps it organized.

---

## Quick start

You need two free tools: **Obsidian** (a nice window into the folder) and an AI
with file access (**Claude Code** or **ChatGPT**).

```bash
# 1. Get the folder (download the ZIP from GitHub, or clone it)
git clone https://github.com/shipwithmax/command.git ~/command
```

```
# 2. Open it in Obsidian
#    Obsidian → "Open folder as vault" → choose ~/command

# 3. Open the same folder in your AI
#    Claude Code: open the app → "Open project" → choose ~/command
#    ChatGPT: make a Project, upload CLAUDE.md + your key files

# 4. Bring it to life
#    Tell your AI: "Use the command-init skill to set up my first venture."
```

Your AI reads `CLAUDE.md` first and instantly knows how to navigate. Obsidian
reads the markdown directly. The `command-init` skill asks you a few questions
and populates your first project in about two minutes.

> New to this? Read [`docs/frameworks.md`](./docs/frameworks.md) for the thinking,
> or just start capturing and let your AI guide you.

---

## The folder, in plain English

| Folder | What it's for |
|---|---|
| `inbox/` | **Everything lands here first.** Captures, transcripts, PDFs, screenshots — sorted later. |
| `wiki/` | **Your business's Wikipedia.** One clean page per venture, person, or concept. Your AI maintains it; you review. |
| `ventures/` | **Things you own.** Notes, decisions, and links for each project or business. |
| `missions/` | **Active to-dos**, each linked to your task tool (Linear / Todoist / Notion). |
| `strategy/` | **The big picture** — objectives, quarterly rocks, annual themes. |
| `cadence/` | **Your rhythms** — daily / weekly / monthly / quarterly / yearly templates that keep the system alive. |
| `atlas/` | **Maps** — dashboards and index pages that point to everything else. |
| `templates/` | **Reusable patterns** — meeting notes, decision entries, new-venture boilerplate. |
| `tools/` | **Reusable scripts + AI skills** (like `command-init`). |
| `compute/` | **What's running for you** — your stack and automations, in writing. |
| `archive/` | **Done / parked.** Where finished work goes to rest. |

Four files at the root: **`CLAUDE.md`** (instructions your AI reads first — you
write this), **`MEMORY.md`** (what your AI learns about how you work),
**`index.md`** (a catalog of your wiki), **`log.md`** (a one-line-per-day
activity log).

The structure is opinionated on purpose. Don't fight it for a month, then change
what doesn't fit you.

---

## Why this works

When AI output feels junior, the problem is almost never a junior *model* — it's
a junior *context window*. The folder is how you give your AI senior context.
Put your strategy, decisions, and notes somewhere it can read, and every prompt
gets better. **The structure is the contract.**

### It's also Obsidian-native

The folder *is* an [Obsidian](https://obsidian.md) vault. `[[wikilinks]]`, graph
view, and daily notes all work. Not every interface needs to be custom-built —
markdown files in a folder are already a great editing experience, with version
control and AI navigation underneath. **Don't build a UI when a folder will do.**
(It even holds interactive HTML dashboards — see
[`docs/html-in-the-vault.md`](./docs/html-in-the-vault.md).)

---

## This is now an open standard

In **June 2026**, Google Cloud published the
[**Open Knowledge Format (OKF)**](https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing)
— a vendor-neutral standard for representing knowledge as *a directory of
markdown files with light YAML frontmatter, linked into a graph, with `index.md`
and `log.md` conventions.*

That's `command`. This folder independently converged on the exact pattern Google
just formalized — it's had `index.md` and `log.md` since before OKF existed. Your
`wiki/` is now a valid OKF bundle, which means OKF-aware tools (including Google's
single-file HTML graph visualizer) can read your business out of the box. Details
in [`docs/open-knowledge-format.md`](./docs/open-knowledge-format.md).

You didn't bet on a fad. You bet on the standard.

---

## Going deeper (optional)

The beginner layer above is all you need to get real value. When you're ready for
more, the folder becomes an operating layer you can *deploy from* and *connect to
other tools*:

- [`docs/advanced.md`](./docs/advanced.md) — the four operations + Build / Deploy / Integrate, MCP/API/SDK patterns, missions, Cloudflare.
- [`docs/secrets.md`](./docs/secrets.md) — how to keep credentials safe (the one rule with no exceptions).
- [`docs/frameworks.md`](./docs/frameworks.md) — what this is built on: PARA, August Bradley's PPV, Karpathy, OKF.
- [`docs/open-knowledge-format.md`](./docs/open-knowledge-format.md) — how `command` maps to Google's OKF.
- [`docs/html-in-the-vault.md`](./docs/html-in-the-vault.md) — keeping interactive HTML next to your markdown.

---

## What's NOT in here

**No credentials. Ever.** API keys, passwords, `.env` files — none of it lives in
this folder. Secrets live *outside*, in a locked folder of their own. This matters
more than it sounds (git history is forever; AI agents read your files). The full
why-and-how is in [`docs/secrets.md`](./docs/secrets.md).

**No project code.** Your apps live in their own GitHub repos, linked from
`ventures/<name>/_links.md`. This folder holds *context and decisions*, not source.

---

## What's built on

`command` is a synthesis of four proven ideas, pointed at one solo operator
running a business with AI:

- **[PARA](https://fortelabs.com/blog/para/)** (Tiago Forte) — organize by how soon you'll act on something, not by topic.
- **PPV** (August Bradley) — run the system as a living machine on a cadence, not a pile of notes.
- **[Andrej Karpathy](https://karpathy.ai)** — a folder of markdown is the best interface for an AI. The original lever.
- **[Open Knowledge Format](https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing)** (Google, 2026) — the open standard that proves the pattern.

With thanks to **Peter Naur** (*Programming as Theory Building*), **BAIR/DSPy**
(*compound AI systems*), **Anthropic Engineering** (*the folder is context
engineering*), and **Naval Ravikant** (*code is permissionless leverage*). Full
write-up in [`docs/frameworks.md`](./docs/frameworks.md).

---

## License

MIT ([full text](./LICENSE)). Use it. Fork it. Make it yours. Tell us what you change.

The full operating model — **Command** (this folder) + **Compute** (your AI +
infrastructure) + **Cadence** (the daily practice that compounds) — is taught at
[max-ship.com](https://max-ship.com). The folder works on its own. It works
*better* when you also run the Cadence.

— Max

*v0.4 · public release · MIT*
