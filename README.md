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
#    Codex, Cursor and others: open the folder (they read AGENTS.md, which points to CLAUDE.md)
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
| `missions/` | **Active work.** One file per piece of work. Links to your task tool (Linear / Todoist / Notion) if you use one, or is the record if you don't. |
| `strategy/` | **The big picture**: objectives, quarterly rocks, annual themes. |
| `cadence/` | **Your rhythms**: daily / weekly / monthly / quarterly / yearly templates that keep the system alive. |
| `atlas/` | **Maps**: dashboards and index pages that point to everything else, plus tonight's handoff to tomorrow. |
| `templates/` | **Reusable patterns**: missions, meeting notes, decisions, wiki pages, new-venture boilerplate. |
| `tools/` | **Reusable scripts + AI skills** (like `command-init`), plus optional guardrail hooks. |
| `compute/` | **What's running for you**: your stack and automations, in writing. |
| `docs/` | **How the kit works.** The frameworks, secrets, agent autonomy, tracking, advanced setup. |
| `archive/` | **Done / parked.** Where finished work goes to rest. |

Five files at the root: **`CLAUDE.md`** (instructions your AI reads first. You
write this), **`AGENTS.md`** (a pointer to `CLAUDE.md` for tools that look for
that name), **`MEMORY.md`** (what your AI learns about how you work),
**`index.md`** (a catalog of your wiki), **`log.md`** (one line per thing that
happened, append-only).

The structure is opinionated on purpose. Don't fight it for a month, then change
what doesn't fit you.

---

## A day with `command` (optional, but it's where it clicks)

Three skills turn the folder into a daily loop. Just say the words:

- **Morning:** *"Brief me."* The `daily-brief` skill reads last night's handoff
  and your active work, then helps you pick the first block.
- **While you work:** *"Focus on the menu page."* The `focus` skill ties the
  session to one task and keeps a one-line footer, so neither you nor the AI
  drifts.
- **Evening:** *"Shutdown."* The `shutdown` skill takes your brain dump, gets a
  call on every open item (do, re-date, delegate, drop), and writes
  `atlas/handoff.md` so tomorrow starts where today stopped.

Your AI forgets between sessions. The handoff and the log don't.

---

## Your AI, with guardrails

The more your AI can do, the more it matters what it does *on its own*.
`CLAUDE.md` sorts actions into three tiers:

- **Green, just do it:** read, write notes, research, draft, update the log.
- **Yellow, ask once:** push a branch, install things, change automations.
- **Red, always ask:** send or publish anything, deploy, merge, delete, spend,
  touch secrets.

Drafts are always fine. Sending is always yours. Code goes through a pull
request that you merge: *agents propose, humans merge.* Want the rules
enforced, not just written down? Optional hooks in
[`tools/hooks/`](./tools/hooks/) block risky commands before they run. They're
off until you turn them on. Details in
[`docs/agent-autonomy.md`](./docs/agent-autonomy.md).

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

- [`docs/advanced.md`](./docs/advanced.md): the four operations + Build / Deploy / Integrate, MCP/API/SDK patterns, missions, Cloudflare.
- [`docs/agent-autonomy.md`](./docs/agent-autonomy.md): what your AI may do alone, production gates, optional hooks.
- [`docs/tracking-work.md`](./docs/tracking-work.md): one source of truth, repo vs folder work, shared vs private, handoffs, meetings.
- [`docs/secrets.md`](./docs/secrets.md): how to keep credentials safe (the one rule with no exceptions).
- [`docs/frameworks.md`](./docs/frameworks.md): what this is built on: PARA, August Bradley's PPV, Karpathy, OKF.
- [`docs/open-knowledge-format.md`](./docs/open-knowledge-format.md): how `command` maps to Google's OKF.
- [`docs/html-in-the-vault.md`](./docs/html-in-the-vault.md): keeping interactive HTML next to your markdown.

---

## What's NOT in here

**No credentials. Ever.** API keys, passwords, `.env` files — none of it lives in
this folder. Secrets live *outside*, in a locked folder of their own. This matters
more than it sounds (git history is forever; AI agents read your files). And
`.gitignore` only stops a file being committed. It doesn't stop an agent reading
it. The full why-and-how is in [`docs/secrets.md`](./docs/secrets.md).

**No crown jewels.** Unfiled inventions, trade-secret recipes, NDA material: keep
them in a separate folder your AI can't read. The folder is for context, not for
your moat.

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

## Changelog

### v0.5 (November 2026)

The kit catches up with what a live command center learned in the months
since v0.4.

- **Autonomy tiers** in `CLAUDE.md`: green (do), yellow (ask once), red
  (always ask). Sending and publishing are always the captain's call.
- **More non-negotiable rules:** main is production, diff before commit, no
  exfiltration, drafts only outside the folder, ask once when unclear.
- **A "Current focus" block** at the top of `CLAUDE.md`, so back-burner work
  doesn't crowd out the priority.
- **Tracking work:** one source of truth per kind of work, repo work vs folder
  work, keeping shared and private work apart, linking the exact file, and
  meetings with consent. New doc: `docs/tracking-work.md`.
- **Five new skills:** `process-inbox`, `lint-folder`, `daily-brief`, `focus`
  and `shutdown` (with a nightly `atlas/handoff.md`). `command-init` updated.
- **Optional hooks** in `tools/hooks/`: block risky shell commands, keep the
  folder's shape, and log what was blocked. Off by default.
- **Secrets, three layers deep:** `.gitignore` is a commit net, not a read
  block; agent read blocks; platform secrets for deployed code; an IP
  carve-out. New: `tools/integrations/cloudflare-secrets.md`.
- **New doc:** `docs/agent-autonomy.md` (tiers, production gates, enforcement).
- **`AGENTS.md`** at the root, a pointer to `CLAUDE.md` for Codex, Cursor and
  other tools. One source of truth, no drift.
- **Real templates:** mission, venture, decision, meeting note, wiki page,
  person, daily note, handoff.
- **`missions/` and `archive/` now ship** with a README. They were described
  before but not included.
- **Fixes:** the root-file list now includes `README.md` and `LICENSE`; wiki
  frontmatter uses `timestamp` everywhere; broken links in `compute/` fixed;
  cadence templates made generic.

### Earlier

- **v0.4** (July 2026): two-tier rewrite, `inbox/` replaces `raw/`, OKF
  alignment. Also new since v0.3: `MEMORY.md` and the three-layer memory
  model; the `cadence/`, `compute/` and `strategy/` folders.
- **v0.3** (May 2026): the first skill, `command-init`; deeper integrations;
  the secrets rationale.
- **v0.2:** ethos-first README, expanded `CLAUDE.md` schema.
- **v0.1:** the first public stencil.

---

## License

MIT ([full text](./LICENSE)). Use it. Fork it. Make it yours. Tell us what you change.

The full operating model — **Command** (this folder) + **Compute** (your AI +
infrastructure) + **Cadence** (the daily practice that compounds) — is taught at
[max-ship.com](https://max-ship.com). The folder works on its own. It works
*better* when you also run the Cadence.

— Max

*v0.5 · public release · MIT*
