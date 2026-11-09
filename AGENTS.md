# AGENTS.md

This folder's instructions for AI agents live in **[`CLAUDE.md`](./CLAUDE.md)**.
Read that file first, every session, and follow it. It applies to every agent
and every tool, not just Claude.

Why a pointer and not a copy: some tools read `AGENTS.md` (Codex, Cursor and
others) and some read `CLAUDE.md`. Two full copies drift apart within weeks,
and then each tool follows different rules. One source, one pointer.

Quick orientation, in case your tool doesn't follow links:

- Read `CLAUDE.md` for structure, rules and autonomy tiers.
- If `atlas/handoff.md` exists, read it next.
- Skills live in `tools/skills/<name>/SKILL.md`. When asked to run one, read it and follow it.
- New captures go in `inbox/`. Never create files at the root.
- Never read secrets. Never send, publish, deploy or merge without the captain's go.
