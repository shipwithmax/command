# compute — the engine of your business

> The second C of the **Captain's Flywheel** (Command · Compute · Cadence).
> This folder catalogs what's actually running for you.

## What lives here

- **[stacks-overview.md](./stacks-overview.md)** — the technology bundles you've assembled. One section per Stack.
- (Add more files as you spin up specific Stack docs — `cloudflare-stack.md`, `email-stack.md`, etc.)

## What is Compute?

Compute is the engine. The crew. Where [Command](../command/) writes the brief, Compute executes it.

Compute encompasses every machine doing work for you:

- Claude, GPT, and other LLMs
- Claude Code and other AI coding agents
- Cloudflare Workers running scheduled jobs
- MCPs giving the AI access to your tools (Linear, GitHub, Notion, etc.)
- Hosted services, deployed scripts, integrations

You don't run all of it manually. Most of it runs while you sleep. The captain's job in Compute is to **organize what's running, name the bundles (Stacks), and decide what gets retired or upgraded.**

## Stacks — the legible unit of Compute

A Stack is a bundle of tools configured for a specific class of problem. The Cloudflare Edge Stack (Workers + D1 + R2 + Pages + Access). The Content Production Stack (Claude + HeyGen + Remotion + Zernio). The MCP Stack (Linear + GitHub + PostHog + Notion).

Stacks are how Compute becomes legible to you. Without them, "Compute" is a sprawl. With them, it's a list of cookbooks.

The site at [max-ship.com/log/stacks](https://max-ship.com/log/stacks) maintains a living catalog of the Stacks we've documented. Use them as reference; build your own; populate `stacks-overview.md` with what you actually run.

## How AI uses this folder

When you ask Claude to add a new automated job, point it at `compute/stacks-overview.md` first. It'll know your existing infrastructure, what tools you already pay for, what conventions to match. Output gets dramatically better when the AI doesn't have to guess your stack from context-free prompts.

## What goes here vs. elsewhere

- **Compute (here):** active running infrastructure, deployed services, agents, scheduled jobs
- **Tools you considered but didn't pick:** notes in `command/decisions/` or similar
- **Marketing of tools (affiliate notes, etc.):** [public ToolCard registry](https://github.com/shipwithmax/maxship-site/blob/main/src/data/tools.ts), not here

Keep this folder honest. Only what's actually running.

---

Maintained as part of the open-source **Command Kit** at [github.com/shipwithmax/command](https://github.com/shipwithmax/command).
