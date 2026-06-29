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
You say *"build me a thing."* The AI reads `CLAUDE.md` + relevant `wiki/` pages, then drops scripts in `tools/` or scaffolds a venture in `ventures/<name>/`, writes a `decisions.md` entry, and logs it.

### Deploy
For cloud artifacts (Cloudflare Workers, scheduled jobs, custom MCPs): the AI deploys from inside the folder (`wrangler deploy`, etc.), captures the live URL in `ventures/<name>/_links.md`, and logs the deploy.

### Integrate
For external services (Linear, Notion, GitHub, your CRM): reference patterns live in `tools/integrations/`, MCPs in `tools/mcps/`. Secrets stay outside the repo — see [`secrets.md`](./secrets.md).

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
- **`log.md`** — append-only, one line per operation: `## [YYYY-MM-DD] operation | description`. Operations: `ingest · query · compile · lint · decision · ship · build · deploy · integrate`. This becomes your running narrative; AI reads it for recent context.

## missions/ format

Each mission file is thin — your PM tool (Linear / Todoist / Notion) is the
source of truth. The mission file holds the context the PM tool doesn't:

```markdown
---
type: mission
pm_tool_id: PROJ-42
status: in-progress
---
# PROJ-42: Short description
[Open in PM tool](https://your-pm-tool.com/issue/PROJ-42)

## Notes
- Context not captured in the PM tool: decisions, links to inbox/ material, half-formed ideas
```

## Optimized for Cloudflare, portable everywhere

`command` assumes the Cloudflare stack (Workers, D1, R2, Email Routing, Cron, KV)
because that's what MaxShip runs on — but the structure doesn't care. Use AWS,
Vercel, Render, or your own VPS. The folder is portable.
