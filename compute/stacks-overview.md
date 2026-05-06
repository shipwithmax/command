# Compute — Stacks Overview

> Edit this file to list the technology bundles you actually run. Each Stack
> gets a short section. When a Stack grows enough to warrant its own file,
> spin it out (`compute/cloudflare-stack.md`, etc.) and link from here.

## Conventions

- One Stack = one section
- For each Stack: **name**, **what it does**, **tools in the bundle**, **what depends on it**, **last reviewed** date
- Mark **deprecated** Stacks with `~~strikethrough~~` until you remove them — captures history

---

## Cloudflare Edge Stack

**What it does:** Hosting + edge compute + database + storage + auth + email routing for our public sites.

**Tools in the bundle:**
- Cloudflare Workers (hosting + edge functions)
- Cloudflare D1 (SQLite at the edge)
- Cloudflare R2 (object storage)
- Cloudflare Pages (legacy — migrating to Workers Sites)
- Cloudflare Access (auth gating for internal tools)
- Cloudflare Email Routing (free email forwarding for custom domains)

**What depends on it:**
- max-ship.com
- (your other ventures here)

**Last reviewed:** YYYY-MM-DD

---

## Compute / AI Coding Stack

**What it does:** Where the captain writes prompts and the AI agents do the labor.

**Tools in the bundle:**
- Claude Code (Anthropic CLI agent — primary)
- Cursor (AI-native IDE — secondary, for visual editing flows)
- Linear MCP, GitHub MCP, Cloudflare MCP, PostHog MCP

**What depends on it:**
- Every shipped change in the last quarter

**Last reviewed:** YYYY-MM-DD

---

## (Add your other Stacks below)

Spin out a section per Stack you actively run. Keep this honest — only what's actually running, not what you considered.
