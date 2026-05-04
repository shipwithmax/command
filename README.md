# command

> **A folder you build your business out of. Open-source. AI-readable. Yours to fork.**

`command` is a markdown-first, version-controlled, AI-navigable knowledge base — designed to be the **brain** of a small operator's business. One human captain. A crew of AI agents. The same folder structure both navigate.

It's the **Command** layer in the *Command · Compute · Cycle* operating model taught at [MaxShip](https://max-ship.com).

---

## Why this exists

When AI output feels junior, the diagnosis is almost always **junior context**. Not a junior model — a junior context window.

The folder is how you give your AI senior context. It's an expansion of [Andrej Karpathy's filesystem-as-AI-interface](https://x.com/karpathy) thinking, built specifically for the operator who's shipping product, talking to customers, and running marketing — not just building agents in isolation.

Once you put your strategy, decisions, customer notes, and active projects into a structure your AI can read, every prompt gets dramatically better. **The structure is the contract.** AI tools (Claude Code, Cursor, anything with filesystem access) navigate it the same way you do. They write back to the same files. The folder becomes the operating layer of your business.

---

## What's different about this expansion

Karpathy's pattern is built around four operations on a knowledge folder: **Ingest · Query · Compile · Lint**.

`command` keeps those four. Then it adds the operator-grade pieces:

- **Live integrations** — connect Linear, Todoist, Notion, GitHub, Cloudflare D1, your CRM. The folder isn't just a notes archive; it's a working surface that your AI agents act through.
- **Deployable workflows** — `tools/` ships with patterns for spinning up standalone scripts and Cloudflare Workers from inside the folder. Your AI can build, deploy, and iterate without leaving the room.
- **Project archive** — `archive/` for finished work, `missions/` for active work mapped to your PM tool, `ventures/` and `clients/` for the actual entities you operate.
- **Obsidian-native** — open the folder in [Obsidian](https://obsidian.md). It's already a vault. `[[wikilinks]]` work. Graph view works. Daily notes work. The folder is markdown; Obsidian is the lens.
- **Secrets-safe by design** — `.gitignore` blocks common credential patterns. Your `.env` lives outside the repo, not inside.
- **MCP / API / SDK ready** — three integration patterns spelled out in `CLAUDE.md`: MCPs for AI-driven actions, APIs for direct service calls, SDKs for custom tooling.

It's optimized for **Cloudflare** (Workers, D1, R2, Email Routing) — same stack the rest of MaxShip runs on — but the folder is portable. Use AWS, Vercel, your own VPS. The structure doesn't care.

---

## Quick start

```bash
# 1. Clone
git clone https://github.com/shipwithmax/command.git ~/command
cd ~/command

# 2. Open in Claude Code (or your AI tool)
claude

# 3. Open in Obsidian
# File → Open Folder as Vault → ~/command
```

Claude reads `CLAUDE.md` first and knows how to navigate. Obsidian reads the markdown directly. You're up.

Then start populating:
- `ventures/` for things you own
- `clients/` for paid engagements
- `wiki/people/` for everyone in your orbit
- `raw/` for source material (PDFs, transcripts, screenshots)
- `log.md` for the daily one-line append

The structure is opinionated. **That's the point.** Don't fight it for a month, then change what doesn't work.

---

## What's in here

| Folder | Purpose |
|---|---|
| `raw/` | **Immutable source material.** Articles, transcripts, screenshots, data exports. You add. AI reads. Never edits in place. |
| `wiki/` | **AI-compiled knowledge.** One entity page per venture, client, person, or concept. AI maintains, you review. Cross-linked with `[[wikilinks]]`. |
| `ventures/` | **Things you own.** Code links, ops notes, decisions per venture. |
| `clients/` | **Paid engagements.** Same shape as ventures, different commercial relationship. |
| `missions/` | **Thin pointers to your PM tool.** One file per Linear / Todoist / Notion ticket. Holds context the PM tool doesn't. |
| `atlas/` | **Navigation maps + dashboards.** Maps of the territory — *"All my active engagements"*, *"All ventures by status"*. |
| `templates/` | **Reusable patterns** — meeting notes, mission files, decision entries. |
| `tools/` | **Reusable scripts + utilities.** Bash one-liners, deployment helpers, custom AI skills. |
| `archive/` | **Old / done / deprecated.** Where finished work goes to rest. |

Three files at root:

- [`CLAUDE.md`](./CLAUDE.md) — schema, decision tree, operations, rules. AI reads this first.
- [`index.md`](./index.md) — machine-maintained catalog of `wiki/` pages.
- [`log.md`](./log.md) — append-only activity log. One line per operation. The captain's running narrative.

---

## How to work in here

The four operations any AI tool performs against this folder:

1. **Ingest** — new material lands in `raw/`. AI summarizes, creates/updates `wiki/` pages, logs to `log.md`.
2. **Query** — you ask a question. AI searches `wiki/` and `raw/` first, synthesizes with citations.
3. **Compile** — periodic rebuild of `wiki/` from `raw/`. Cross-references maintained.
4. **Lint** — structural health check. Files in wrong places, orphan pages, stale entries, missions missing PM links.

These are taught in detail in MaxShip's Week 1 course material.

### Plus the operator extensions:

5. **Build** — spin up a script in `tools/`, a Worker in `ventures/<name>/`, a custom MCP in `tools/mcps/`. Your AI can build inside the folder.
6. **Deploy** — push artifacts to Cloudflare (or wherever) without leaving the room. Deploy logs land in `log.md`.
7. **Integrate** — connect external systems (Linear, Notion, your CRM) via MCPs. Reference patterns live in `tools/integrations/`.

---

## What's NOT in here

- **Credentials, API tokens, passwords.** They live outside this repo. Recommended convention: `~/<your-secrets>/` with `chmod 700` on the directory and `chmod 600` on individual files. The `.gitignore` here blocks common patterns to catch accidents — but the contract is *you keep secrets out of this folder, period.*
- **Project code.** Your ventures' actual codebases live in their own GitHub repos, referenced from `ventures/<name>/_links.md`.
- **Client-confidential material.** This is a public template. The real `command/` you build will hold sensitive context — that's why it stays a private repo on your machine.

---

## License

MIT. Use it. Fork it. Make it yours. Tell us what you change.

---

## Credits

This pattern was developed and stress-tested across multiple operating businesses. It's influenced by — and stands on the shoulders of — these thinkers and frameworks:

- **[Andrej Karpathy](https://karpathy.ai)** — filesystem-as-AI-interface, structure-of-thought, the LLM Wiki concept. The original lever this whole approach turns on.
- **Peter Naur · *Programming as Theory Building* (1985)** — the captain's vision is the program. Code is the shadow. Theory must live somewhere your AI can read.
- **BAIR / Stanford / DSPy — *The Shift from Models to Compound AI Systems*** (Zaharia, Khattab et al., Feb 2024) — small composed systems beat monoliths. The folder is how you compose.
- **Anthropic Engineering** — *"the folder and file structure of an agent becomes a form of context engineering"* — independent convergence on the same pattern.
- **Naval Ravikant** — *code is the most powerful form of permissionless leverage.* Permissionless leverage starts with owning your structure.
- **Interpreted Context Methodology (ICM)** — RinDig's open-source articulation of structured-context-for-AI.

### Personal shoutouts

- **George Collins** — for the long conversations on structured AI input vs. junior output. Pushed the diagnosis until it was clean: it's the context, not the model.
- **Kevin** — for the systems-design lens on integrating cloud infrastructure with AI navigation. Shaped how `tools/` and `ventures/` connect.

Both are sharper than I am on AI development and architecture. A lot of what's in `CLAUDE.md` is the residue of arguments with them.

---

## Where this goes from here

This repo gets pushed updates roughly once a month, announced on [@shipwithmax](https://youtube.com/@shipwithmax). Watch for `v0.x` tags. Pull as you wish.

The full operating model — Command (this folder) + Compute (Cloudflare + AI) + Cycle (the daily practice that compounds) — is taught at [max-ship.com](https://max-ship.com). The folder works on its own. It works *better* when you also build the Compute layer and run the Cycle.

---

*v0.2 · public release · MIT*
