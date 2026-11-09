# MEMORY.md — Auto Memory

> **This file is maintained by Claude, not by you.**
>
> Claude writes here when it notices a pattern, preference, or recurring correction
> in how you work. You read it occasionally. You can edit it to fix a misobservation,
> but in general — let Claude maintain it.

---

## How this fits with CLAUDE.md

Anthropic's three-layer memory model (March 2026):

| Layer | Who writes it | What it holds |
|-------|---------------|---------------|
| **`CLAUDE.md`** | **You (the captain)** | Explicit instructions. Routing rules. "How I want things done." Brief, high-signal, opinionated. |
| **`MEMORY.md`** (this file) | **Claude (auto)** | What Claude has *observed* about your patterns and preferences. Loads first 200 lines at session start. |
| **Chat memory** | **Claude (cross-session)** | Conversation context across sessions, surfaced when relevant. |

**Critical rule:** Routing rules and explicit instructions belong in `CLAUDE.md`, not here.
This file is for *learnings* — things Claude noticed about how you actually work, not things you told it explicitly.

---

## How Claude keeps this file useful

- **One line per memory, dated.** Absolute dates (`2026-11-09`), never "last week".
- **Corrections beat observations.** When the captain corrects something, record it
  under Corrections, and drop or fix the old entry.
- **Check before acting.** A memory can go stale. If it matters, confirm it still
  holds before relying on it.
- **Don't duplicate.** If it's already in `CLAUDE.md`, a wiki page, or the code, link
  to it instead of copying it.
- **Stay under 200 lines.** Only the top of the file loads every session. When it
  grows, merge similar entries or move detail into a wiki page and keep a one-line
  pointer here.
- **Nothing sensitive.** No secrets, no health or money details, no personal remarks
  about other people.

---

## Observed patterns

_(Claude appends new observations below as it learns. Each entry has a date and a brief note.)_

<!-- Example format:
- **2026-05-04** — Captain prefers commas over em dashes in prose. Avoid em dashes in drafts.
- **2026-05-05** — When asked for "research," captain wants source URLs in a final References section, not inline.
-->

---

## Corrections from the captain

_(If Claude got something wrong here, you can edit. Add a `(corrected)` tag so we both remember.)_

---

## Why the kit ships with this file

Without `MEMORY.md`, Claude's auto-memory system has nowhere to surface its learnings inside your folder, so the observations live in chat memory only. With `MEMORY.md` here, Claude treats it as part of the project context, which means:

1. The patterns Claude learns from you become *visible* to you (you can read them).
2. The patterns *travel with the folder* if you fork or share it.
3. You can correct misobservations once and have the correction stick.

This is a small file. It will grow over time as Claude works with you. Don't manually fill it. Just let it accumulate.
