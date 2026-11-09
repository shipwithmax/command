# Advanced — turning the folder into an operating layer

> The beginner layer (`README.md` + `CLAUDE.md`) is all you need to get value
> from `command`. This doc is for when you're ready to make the folder *do
> things* — deploy infrastructure, talk to other tools, run automations.
>
> None of this is required. Skip it until you want it.

## The four core operations (Karpathy pattern)

Every AI tool performs these four against the folder:

1. **Ingest** — new material lands in `inbox/`. AI summarizes it, creates/updates `wiki/` pages, logs to `log.md`.
2. **Query** — you ask a question. AI searches `wiki/` and `inbox/` first, answers with citations.
3. **Compile** — periodic rebuild of `wiki/` from `inbox/` sources; cross-references maintained.
4. **Lint** — structural health check: files in wrong places, orphan pages, stale entries.

## The three operator extensions

`command` is built for shipping, not just note-taking. These sit alongside the four:

### Build
You say *"build me a thing."* The AI reads `CLAUDE.md` + relevant `wiki/` pages, then drops scripts in `tools/` or scaffolds a venture in `ventures/<name>/`, writes a `decisions.md` entry, and logs it. If the thing runs on its own (a scheduled job, a Worker), it also goes in `compute/`.

### Deploy
For cloud artifacts (Cloudflare Workers, scheduled jobs, custom MCPs): the AI prepares the deploy from inside the folder (`wrangler deploy`, etc.), the captain approves it (deploys are red tier), then the AI captures the live URL in `ventures/<name>/_links.md` and logs the deploy.

### Integrate
For external services (Linear, Notion, GitHub, your CRM): reference patterns live in `tools/integrations/` (starting with [`cloudflare-secrets.md`](../tools/integrations/cloudflare-secrets.md)), MCPs in `tools/mcps/`. Secrets stay outside the repo — see [`secrets.md`](./secrets.md).

## Three integration patterns — when to use which

| Pattern | When | Example |
|---|---|---|
| **MCP** (Model Context Protocol) | When you want the AI to **act** on a service interactively. | Cloudflare MCP for deploys. GitHub MCP for repo navigation. Linear MCP for tickets. |
| **API** | When you want **deterministic** machine-to-machine calls — scheduled jobs, webhooks. | A Worker calls Resend to send email. A cron job calls an LLM to summarize yesterday's `log.md`. |
| **SDK** | When you want **richer** programmatic control or local-first tools. | Anthropic SDK in a `tools/` script. |

Most things work with just MCPs. Reach for APIs when you need scheduled or
deterministic. Reach for SDKs when you're bundling multiple service calls.

## index.md and log.md

- **`index.md`** — machine-maintained catalog of `wiki/` pages. Update it after every Ingest or Compile. Keep under 200 lines.
- **`log.md`** — append-only, one line per operation: `## [YYYY-MM-DD] operation | description`. Operations: `ingest · query · compile · lint · decision · ship · build · deploy · integrate · brief · shutdown`. This becomes your running narrative; AI reads it for recent context.

## missions/ format

One file per piece of active work, from [`templates/mission.md`](../templates/mission.md).
It works with or without a tracker:

- **With a tracker** (Linear, Todoist, Notion): the tracker is the record. Put
  the ticket in `tracker:`. The mission file holds the context the tracker
  doesn't: decisions, links to inbox material, half-formed ideas.
- **Without one:** leave `tracker:` empty. The mission file plus `log.md` is the
  record.

```markdown
---
type: mission
title: Menu page
status: in-progress
owner: captain
venture: "[[acme-coffee]]"
tracker: ACME-42            # or a link, or empty
due: 2026-12-01
created-by: agent
---
# Menu page

## Done looks like
A live menu page with this season's beans and prices.

## Current status
Draft copy done. Waiting on photos.

## Next step
Captain picks 6 photos (by Friday).
```

Statuses: `todo · in-progress · blocked · paused · done · dropped`. The
`daily-brief`, `shutdown` and `lint-folder` skills read them. More in
[`tracking-work.md`](./tracking-work.md).

## Deploys stay behind a gate

Build and Deploy are where an agent can do the most good and the most damage.
The agent builds, tests and opens a pull request. You merge, and the deploy
runs from `main`. Branch protection, required checks and the autonomy tiers
are in [`agent-autonomy.md`](./agent-autonomy.md). Deployed secrets go through
your platform, not a `.env` file: see [`secrets.md`](./secrets.md).

## Optimized for Cloudflare, portable everywhere

`command`'s examples use the Cloudflare stack (Workers, D1, R2, Email Routing,
Cron, KV) because it's cheap, fast and agent-friendly. The structure doesn't
care. Use AWS, Vercel, Render, or your own VPS. The folder is portable.
