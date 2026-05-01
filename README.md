# command

> The folder I run my businesses out of. Now yours.

This is the public, sanitized version of `~/command/` — the working folder that powers MaxShip's daily operations. It's the **Folder layer** in the *Folder + Cloud + Bridge* architecture taught in [MaxShip School](https://shipwithmax.com).

If you're a builder, this gives you the same operating system Max uses for Going Up Agency, Bantam Planet, HBOT Finder, World Wellness Guide, MaxShip itself, and every client engagement. Same shape. Same rules. Yours to fork.

## What it is

A markdown-first, AI-readable, git-versioned **command center** for one human captain plus a crew of AI agents. The structure is the contract: AI tools (Claude Code, Cursor, anything that can read a filesystem) navigate it the same way you do, and write back to the same files.

The folder is not the system — the folder is the **brain**. It pairs with:

- **Cloud** — your deployed systems on Cloudflare Workers (or wherever you run your muscle)
- **Bridge** — your daily presence at the helm: ~10 questions, decisions, content, executive action

The three layers together = the whole ship. This repo is layer 1.

## Quick start

```bash
git clone https://github.com/shipwithmax/command.git ~/command
cd ~/command
```

Open in Claude Code (or your AI tool of choice). It'll read [`CLAUDE.md`](./CLAUDE.md) and know how to navigate.

```bash
cd ~/command && claude
```

Then start populating:
- `ventures/` for things you own
- `clients/` for paid engagements (if any)
- `wiki/people/` for everyone in your orbit
- `raw/` for source material (PDFs, transcripts, screenshots)
- `log.md` for the daily append-only

The structure is opinionated. That's the point. Don't fight it for a month, then change what doesn't work.

## What's in here

| Folder | Purpose |
|---|---|
| `raw/` | **Immutable source material.** Articles, meeting transcripts, uploads, screenshots, data exports. You add. Claude reads. Never edits in place. |
| `wiki/` | **Compiled knowledge.** One entity page per venture, client, person, concept. Claude maintains, you review. Cross-linked with `[[wikilinks]]`. |
| `ventures/` | **Things you own.** Code, ops, project files. One folder per venture. |
| `clients/` | **Paid engagements.** Same shape as ventures, different commercial relationship. |
| `missions/` | **Thin pointers to your PM tool.** One mission file per Linear / Todoist / Notion ticket. The mission file holds context the PM tool doesn't. |
| `calendar/` | **Daily notes, journal.** Human-authored. Optional. |
| `atlas/` | **Navigation MOCs and dashboards.** Maps of the territory. |
| `templates/` | **Reusable patterns** — meeting-note templates, mission templates, etc. |
| `tools/` | **Your reusable scripts and utilities.** Not project-specific code. |
| `archive/` | **Old / done / deprecated.** Where finished things go to rest. |

Three files at root:

- [`CLAUDE.md`](./CLAUDE.md) — schema, decision tree, operations, rules
- [`index.md`](./index.md) — machine-maintained catalog of `wiki/` pages
- [`log.md`](./log.md) — append-only activity log

## How to work in here

The four operations Claude (or any AI tool) performs against this folder:

1. **Ingest** — new material lands in `raw/`. AI summarizes, creates/updates `wiki/` pages, logs to `log.md`.
2. **Query** — you ask a question. AI searches `wiki/` and `raw/` first, synthesizes with citations.
3. **Compile** — periodic rebuild of `wiki/` from `raw/` sources. Cross-references maintained.
4. **Lint** — structural health check. Files in wrong places, orphan pages, stale entries, missions missing PM links.

These are taught in detail in MaxShip School Module 1.

## What's NOT in here

- **Credentials, API tokens, passwords.** Those live outside this repo (we recommend `~/<your-secrets>/` with `chmod 600` permissions). The `.gitignore` blocks common patterns to catch accidents.
- **Project code.** Your ventures' actual code lives in their own GitHub repos, referenced from `ventures/<name>/_links.md`.
- **Anything client-confidential.** This is a public template. The real `command/` you build for your business will hold sensitive context — that's why it's a private repo on your machine.

## License

MIT. Use it. Fork it. Make it yours. Tell us what you change.

## Credit

If MaxShip School helped you set this up, the folder works best when you also build the Cloud and Bridge layers. Watch the course modules: [shipwithmax.com](https://shipwithmax.com) (TKTK domain — placeholder). YouTube: [@shipwithmax](https://youtube.com/@shipwithmax).

The pattern is influenced by Andrej Karpathy's filesystem-as-AI-interface thinking, the BAIR Compound AI Systems paper (Zaharia & Khattab, Feb 2024), and Peter Naur's *Programming as Theory Building* (1985). The captain's vision is the program. This folder is how you give that program to your AI crew.

## Updates

This repo gets pushed updates roughly once a month, announced in YouTube videos. Watch for the `v0.x` tags. Pull as you wish.

— Max
