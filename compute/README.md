# compute — the engine of your business

> The second C of the **Captain's Flywheel** (Command · Compute · Cadence).
> This folder catalogs what's actually running for you.

## What lives here

- **[stacks-overview.md](./stacks-overview.md)** — the technology bundles you've assembled. One section per Stack.
- (Add more files as you spin up specific Stack docs: `edge-stack.md`, `email-stack.md`, and so on.)

## What is Compute?

Compute is the engine. The crew. Where [Command](../CLAUDE.md) writes the brief, Compute executes it.

Compute covers every machine doing work for you:

- Claude, GPT, and other LLMs
- Claude Code, Codex and other AI coding agents
- Workers and scheduled jobs running in the cloud
- MCPs giving the AI access to your tools (your tracker, GitHub, your docs)
- Hosted services, deployed scripts, integrations

You don't run all of it manually. Most of it runs while you sleep. The captain's job in Compute is to **organize what's running, name the bundles (Stacks), and decide what gets retired or upgraded.**

## Stacks — the legible unit of Compute

A Stack is a bundle of tools configured for a specific class of problem. An Edge Stack (Workers + a database + storage + auth). A Content Stack (an LLM + a video tool + a scheduler). An MCP Stack (your tracker + GitHub + analytics + docs).

Stacks are how Compute becomes legible to you. Without them, "Compute" is a sprawl. With them, it's a list of cookbooks.

The site at [max-ship.com/log/stacks](https://max-ship.com/log/stacks) maintains a living catalog of documented Stacks. Use them as reference; build your own; populate `stacks-overview.md` with what you actually run.

## How AI uses this folder

When you ask your AI to add a new automated job, point it at `compute/stacks-overview.md` first. It'll know your existing infrastructure, what tools you already pay for, and what conventions to match. Output gets much better when the AI doesn't have to guess your stack.

Whenever your AI builds something that runs on its own, it adds it here (see "When you build a tool, write it down" in [`tools/README.md`](../tools/README.md)).

## What goes here vs. elsewhere

- **Compute (here):** active running infrastructure, deployed services, agents, scheduled jobs, and the guardrails around them
- **Tools you considered but didn't pick:** a decision entry in `ventures/<name>/decisions.md`
- **Secrets:** never here. See [`docs/secrets.md`](../docs/secrets.md)

Keep this folder honest. Only what's actually running.

---

Maintained as part of the open-source **Command Kit** at [github.com/shipwithmax/command](https://github.com/shipwithmax/command).
