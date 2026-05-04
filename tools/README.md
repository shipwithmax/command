# tools/

Reusable scripts, utilities, and AI skills. Not project-specific code.

## Structure

```
tools/
├── README.md                 ← you are here
├── skills/                   ← Claude Skills — packaged AI workflows
│   ├── README.md             ← list of shipped skills + how to write your own
│   └── command-init/         ← bootstrap a venture in the folder (ships with v0.3)
├── integrations/             ← (TKTK v0.4) reference patterns for Linear, Notion, Cloudflare, etc.
├── mcps/                     ← (TKTK v0.4) custom MCP servers you've built
└── (your scripts here)       ← bash one-liners, deploy helpers, CLI utilities
```

## What goes here

- Bash scripts that work across multiple ventures
- CLI helpers + custom commands
- Claude Skills (in `skills/`)
- Custom MCP servers (in `mcps/`)
- Integration reference patterns (in `integrations/`)
- Hooks for your AI tool

## What doesn't go here

- Project code (that belongs in the venture's GitHub repo)
- Anything ephemeral
- Anything specific to a single client

## Quick start — invoke the first shipped skill

After you clone the folder, run this in your AI tool:

> *"Use the `command-init` skill to set up my first venture."*

Claude reads `tools/skills/command-init/SKILL.md`, asks you 4 questions, and populates `ventures/<your-thing>/` with a real working structure in 2 minutes. See [`skills/`](./skills/) for the full list of shipped skills.

## Tip

Treat this folder like `~/bin/` — small, sharp, well-tested utilities you reach for repeatedly. If you find yourself writing the same prompt or running the same command twice, package it here.
