# command

> **A folder you build your business out of. Open-source. AI-readable. Yours to fork.**

`command` is a markdown-first, version-controlled, AI-navigable knowledge base — designed to be the **brain** of a small operator's business. One human captain. A crew of AI agents. The same folder structure both navigate.

It's the **Command** layer in the *Command · Compute · Cadence* operating model taught at [MaxShip](https://max-ship.com).

---

## Where this comes from

I built this folder because I was tired of two things at the same time. First — every "AI productivity" tool I tried was a SaaS box that owned my data and reset every time the company changed direction. Second — every prompt I wrote felt like I was re-explaining my business from scratch, even to models I'd been working with for months.

The fix turned out to be simple and structural: **put the business in a folder, give the folder a shape, point your AI at it.** Once the AI could navigate to the right context on its own, my prompts got shorter and the output got dramatically better. Across every model I tried.

I run multiple ventures out of a private version of this folder — board games, AI products, agency engagements, family projects. Same structure, different content. This repo is the public, sanitized template — yours to fork, populate, and make your own.

If you're a solo operator or a small team trying to ship real work with AI as a collaborator (not a toy), this is the substrate that makes that possible.

---

## Why this exists

When AI output feels junior, the diagnosis is almost always **junior context**. Not a junior model — a junior context window.

The folder is how you give your AI senior context. It's an expansion of [Andrej Karpathy's filesystem-as-AI-interface](https://karpathy.ai) thinking, built specifically for the operator who's shipping product, talking to customers, and running marketing — not just building agents in isolation.

Once you put your strategy, decisions, customer notes, and active projects into a structure your AI can read, every prompt gets dramatically better. **The structure is the contract.** AI tools (Claude Code, Cursor, anything with filesystem access) navigate it the same way you do. They write back to the same files. The folder becomes the operating layer of your business.

---

## What's different about this expansion

Karpathy's pattern is built around four operations on a knowledge folder: **Ingest · Query · Compile · Lint**.

`command` keeps those four. Then it adds the operator-grade pieces:

### Live integrations (your folder talks to the world)

- **Cloudflare-deep** — Workers, D1 (serverless SQL for your projects), R2 (zero-egress object storage), Email Routing, Cron triggers, KV. Patterns for each live in `tools/integrations/`. The folder isn't a notes archive — it's the surface from which you deploy infrastructure.
- **Project management bidirectional** — read from and write to **Linear**, **Todoist**, and **Notion**. Find a Notion page, bring an excerpt into your wiki, push updates back. Create a Linear ticket from a mission file. Sync Todoist tasks with daily logs. Your PM tool of choice stays the source of truth; the folder holds context the PM tool doesn't.
- **GitHub-native** — repos referenced from `ventures/<name>/_links.md`. AI can navigate your repo tree, run `gh` commands, draft PRs, and update changelogs.
- **Your CRM, billing, analytics** — pluggable via MCPs (see below). The pattern is consistent: the folder describes the relationship; the integration provides live data.

### Deployable workflows

- `tools/` ships with patterns for spinning up standalone scripts and Cloudflare Workers from inside the folder.
- `tools/skills/` ships with **Claude Skills** — packaged AI workflows your captain can invoke ("run the `command-init` skill on my first venture").
- Your AI can build, deploy, and iterate without leaving the room. Deploys log to `log.md` automatically.

### Obsidian-native

The folder IS an Obsidian vault. Open `~/command` in [Obsidian](https://obsidian.md) — `[[wikilinks]]` work, graph view works, daily notes work, plugins work.

Why this matters: **not every interface needs to be vibe-coded.** People build custom dashboards, custom note-taking apps, custom UI for everything when they don't need to. Markdown files in a folder are already a great editing experience. Obsidian gives you that experience for free, with version control and AI navigation underneath. **Don't build a UI when a folder will do.**

### MCP / API / SDK ready

Three integration patterns spelled out in [`CLAUDE.md`](./CLAUDE.md), easy to adjust:
- **MCPs** for AI-driven actions (Cloudflare, GitHub, Linear, your CRM)
- **APIs** for deterministic machine-to-machine calls (scheduled jobs, webhooks)
- **SDKs** for richer programmatic control (custom tools that bundle multiple service calls)

Most operations work with just MCPs. Reach for APIs when you need scheduled or deterministic. Reach for SDKs when you're building something rich.

### Secrets-safe by design

`.gitignore` blocks common credential patterns. Your `.env` lives outside the repo, not inside. (See *What's NOT in here* below — there's a real reason for this.)

### Optimized for Cloudflare, portable everywhere else

Same stack the rest of MaxShip runs on. The folder is portable. Use AWS, Vercel, Render, your own VPS. The structure doesn't care.

---

## Quick start

```bash
# 1. Clone
git clone https://github.com/shipwithmax/command.git ~/command
cd ~/command

# 2. Open in Claude Code (or your AI tool)
claude

# 3. Open in Obsidian (optional but recommended)
# File → Open Folder as Vault → ~/command

# 4. Run the command-init skill to bootstrap your first venture
# In Claude: "Use the command-init skill to set up my first venture"
```

Claude reads `CLAUDE.md` first and knows how to navigate. Obsidian reads the markdown directly. The `command-init` skill walks you through populating `ventures/<your-thing>/` with your actual project in 2 minutes.

Then keep going:
- `ventures/` for things you own
- `clients/` for paid engagements
- `wiki/people/` for everyone in your orbit
- `raw/` for source material (PDFs, transcripts, screenshots)
- `log.md` for the daily one-line append

The structure is opinionated. **That's the point.** Don't fight it for a month, then change what doesn't work.

---

## What's in here

The kit is organized along the three layers of the Captain's Flywheel — **Command** (this folder + the rest below), **Compute** (the engine), **Cadence** (the rhythms) — plus operational subfolders.

| Folder | Layer | Purpose |
|---|---|---|
| `cadence/` | **Cadence** | The master clock — daily / weekly / monthly / quarterly / yearly templates. Edit them as you run the rhythms. |
| `compute/` | **Compute** | What's actually running for you. Stack catalog. The engine, in writing. |
| `strategy/` | Command | The captain's slow-cadence job. Active objectives, quarterly rocks, annual themes, monthly review. Pairs with the Strategic cadence. |
| `raw/` | Command | **Immutable source material.** Articles, transcripts, screenshots, data exports. You add. AI reads. Never edits in place. |
| `wiki/` | Command | **AI-compiled knowledge.** One entity page per venture, client, person, or concept. AI maintains, you review. Cross-linked with `[[wikilinks]]`. |
| `ventures/` | Command | **Things you own.** Code links, ops notes, decisions per venture. |
| `clients/` | Command | **Paid engagements.** Same shape as ventures, different commercial relationship. |
| `missions/` | Command | **Thin pointers to your PM tool.** One file per Linear / Todoist / Notion ticket. Holds context the PM tool doesn't. |
| `atlas/` | Command | **Navigation maps + dashboards.** Maps of the territory — *"All my active engagements"*, *"All ventures by status"*. |
| `templates/` | Command | **Reusable patterns** — meeting notes, mission files, decision entries. |
| `tools/` | Command | **Reusable scripts + utilities.** Bash one-liners, deployment helpers, custom AI skills, MCP integrations. The starter Claude Skill `command-init` ships here. |
| `archive/` | Command | **Old / done / deprecated.** Where finished work goes to rest. |

Four files at root:

- [`CLAUDE.md`](./CLAUDE.md) — schema, decision tree, operations, rules. **You write this.** AI reads it first every session.
- [`MEMORY.md`](./MEMORY.md) — auto-memory file. **Claude maintains this**, capturing patterns it learns about how you work. Loads first 200 lines at session start.
- [`index.md`](./index.md) — machine-maintained catalog of `wiki/` pages.
- [`log.md`](./log.md) — append-only activity log. One line per operation. The captain's running narrative.

### Anthropic's three-layer memory model (March 2026)

The folder integrates with Anthropic's three-layer memory system:

| Layer | Who writes | What it holds |
|-------|-----------|---------------|
| **`CLAUDE.md`** | You (the captain) | Explicit instructions. Routing rules. "How I want things done." Brief, opinionated. **Not a knowledge dump.** |
| **`MEMORY.md`** | Claude (auto) | Observed patterns and preferences Claude learned from working with you. |
| **Chat memory** | Claude (cross-session) | Conversation context across sessions, surfaced when relevant. |

**Critical rule:** Routing rules belong in `CLAUDE.md`, not `MEMORY.md`. The captain authors instructions; Claude records observations. Don't conflate the two layers.

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

### No credentials. Ever.

API tokens, passwords, .env files, private keys, OAuth secrets — none of it lives in this repo. The `.gitignore` blocks common patterns as a safety net, but the real contract is a habit: **secrets live outside.**

There are five reasons this matters more than it sounds:

1. **Git history is forever.** If you ever commit a token, even if you delete the file in the next commit, the token is permanently in git history. Anyone who clones the repo at any past commit gets it. Public repos? Scraped within minutes by automated bots that mine GitHub for tokens to abuse.
2. **AI agents have filesystem access.** If Claude can read your folder, it can also accidentally include credential strings in outputs (logs, summaries, transcripts to other people). Keep secrets outside the folder and that whole class of leak becomes structurally impossible.
3. **Audit isolation.** When something goes wrong — a token gets compromised, a service is breached — you need to rotate fast. If credentials are scattered across project repos, audit is a nightmare. Centralized in `~/<your-name>-secrets/`, audit is trivial.
4. **Permission isolation.** A folder at `~/<your-name>-secrets/` with `chmod 700` (owner-only access) is OS-enforced. Inside a project repo, file permissions get inconsistent — you push to GitHub, fork to a teammate, sync to a backup, and suddenly a `.env` is on three machines with different ACLs.
5. **Versioning is the wrong tool for credentials.** You don't want a history of every API key you've ever used. You want the *current* key, in one place, easy to rotate. Git is great for code; it's wrong for secrets.

The recommended pattern:

```
~/<your-name>-secrets/                  (chmod 700, owner-only)
├── README.md                            (documentation, fine to read)
├── secrets.env                          (chmod 600, owner-only)
└── .gitignore                           (ignores everything — even if you accidentally `git init` here)
```

Load secrets at the moment of use, via shell substitution. **Never `cat`, `echo`, or paste them into a transcript.**

```bash
export ANTHROPIC_API_KEY=$(grep '^ANTHROPIC_API_KEY=' ~/<your-name>-secrets/secrets.env | cut -d'=' -f2-)
```

Treat every API key like a password. Because it is one.

### No project code

Your ventures' actual codebases live in their own GitHub repos, referenced from `ventures/<name>/_links.md`. The folder holds *context, decisions, ops notes* — not source code. (Tools and scripts in `tools/` are an exception — those are reusable utilities, not project code.)

### No client-confidential material

This is a public template. The real `command/` you build will hold sensitive context — that's why your version stays a private repo on your machine. Use this template as the seed; replace it with your own private fork the moment you start putting real work in.

---

## License

MIT. Use it. Fork it. Make it yours. Tell us what you change.

---

## Credits

This pattern stands on the shoulders of:

- **[Andrej Karpathy](https://karpathy.ai)** — filesystem-as-AI-interface, structure-of-thought, the LLM Wiki concept. The original lever this whole approach turns on.
- **Peter Naur · *Programming as Theory Building* (1985)** — the captain's vision is the program. Code is the shadow. Theory must live somewhere your AI can read.
- **BAIR / Stanford / DSPy** — *The Shift from Models to Compound AI Systems* (Zaharia, Khattab et al., Feb 2024). Small composed systems beat monoliths.
- **Anthropic Engineering** — *"the folder and file structure of an agent becomes a form of context engineering."* Independent convergence on the same pattern.
- **Naval Ravikant** — *code is the most powerful form of permissionless leverage.*
- **Interpreted Context Methodology (ICM)** — RinDig's open-source articulation of structured-context-for-AI.

And thanks to **George** and **Kevin** — for the long conversations that helped me keep this system built well and secure.

---

## Where this goes from here

This repo gets pushed updates roughly once a month, announced on [@shipwithmax](https://youtube.com/@shipwithmax). Watch for `v0.x` tags. Pull as you wish.

The full operating model — Command (this folder) + Compute (Cloudflare + AI) + Cadence (the daily practice that compounds) — is taught at [max-ship.com](https://max-ship.com). The folder works on its own. It works *better* when you also build the Compute layer and run the Cadence.

— Max

---

*v0.3 · public release · MIT*
