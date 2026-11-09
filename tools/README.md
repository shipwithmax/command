# tools/

Reusable scripts, utilities, AI skills and guardrails. Not project-specific code.

## Structure

```
tools/
├── README.md                 ← you are here
├── skills/                   ← AI skills: packaged workflows you invoke by name
│   ├── README.md             ← the shipped skills + how to write your own
│   ├── command-init/         ← set up a venture
│   ├── process-inbox/        ← turn inbox/ captures into wiki pages
│   ├── lint-folder/          ← structural health check
│   ├── daily-brief/          ← morning kickoff
│   ├── focus/                ← bind a work session to one mission
│   └── shutdown/             ← end of day + nightly handoff
├── hooks/                    ← OPTIONAL guardrails that enforce the rules (Claude Code)
├── integrations/             ← reference patterns for other services
│   └── cloudflare-secrets.md ← keep deployed secrets off your disk
├── mcps/                     ← (later) custom MCP servers you've built
└── (your scripts here)       ← one-liners, deploy helpers, CLI utilities
```

## What goes here

- Scripts that work across more than one venture
- CLI helpers and custom commands
- AI skills (in `skills/`)
- Hooks for your AI tool (in `hooks/`)
- Integration reference patterns (in `integrations/`)
- Custom MCP servers (in `mcps/`)

## What doesn't go here

- Project code (that belongs in the venture's own repo)
- Anything ephemeral
- Anything specific to a single venture (keep it in that venture's folder)
- Secrets. Ever. See [`docs/secrets.md`](../docs/secrets.md).

## Quick start

After you clone the folder, tell your AI:

> *"Use the `command-init` skill to set up my first venture."*

Your AI reads `tools/skills/command-init/SKILL.md`, asks you a few questions,
and sets up `ventures/<your-thing>/` in about two minutes. See
[`skills/`](./skills/) for the rest.

## When you build a tool, write it down

Every time you or your AI builds a script, tool or workflow:

1. Save it here (or in the venture it belongs to).
2. If it runs on a schedule or in the cloud, add it to [`compute/`](../compute/).
3. Add a line to `log.md` (`build` or `deploy`).
4. If it's a workflow you'll repeat, turn it into a skill in `skills/`.

A tool nobody remembers is a tool you'll build twice.

## Tip

Treat this folder like `~/bin/`: small, sharp, well-tested utilities you reach
for again and again. If you write the same prompt or run the same command
twice, package it here.
