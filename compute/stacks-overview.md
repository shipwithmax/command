# Compute — Stacks Overview

> Edit this file to list the technology bundles you actually run. Each Stack
> gets a short section. When a Stack grows enough to warrant its own file,
> spin it out (`compute/edge-stack.md`, etc.) and link from here.

## Conventions

- One Stack = one section
- For each Stack: **name**, **what it does**, **tools in the bundle**, **what depends on it**, **last reviewed** date
- Mark **deprecated** Stacks with `~~strikethrough~~` until you remove them. That keeps the history
- No secrets, account IDs or resource IDs here. Names only

---

## Example: Edge Stack

**What it does:** Hosting, edge compute, database, storage, auth and email routing for your public sites.

**Tools in the bundle (one way to do it):**
- Cloudflare Workers (hosting + edge functions)
- Cloudflare D1 (SQLite at the edge)
- Cloudflare R2 (object storage)
- Cloudflare Access (auth gating for internal tools)
- Cloudflare Email Routing (free forwarding for custom domains)

**What depends on it:**
- (your sites here)

**Last reviewed:** YYYY-MM-DD

---

## Example: AI Coding Stack

**What it does:** Where the captain writes prompts and the AI agents do the labor.

**Tools in the bundle:**
- An AI coding agent (Claude Code, Codex, Cursor...)
- MCPs for the tools it needs (your tracker, GitHub, your host)
- Guardrails: the autonomy tiers in `CLAUDE.md`, branch protection on `main`, optional hooks in `tools/hooks/`

**What depends on it:**
- Every shipped change

**Last reviewed:** YYYY-MM-DD

---

## (Add your other Stacks below)

Spin out a section per Stack you actively run. Keep this honest. Only what's actually running, not what you considered.
