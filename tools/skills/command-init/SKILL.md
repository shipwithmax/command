---
name: command-init
description: Set up a venture in the command folder. Asks a few short questions, then creates ventures/<slug>/, a wiki page, an index line and a log line so the folder feels alive within minutes. Use when the captain says "run command-init", "set up my first venture", or "add a new venture".
when_to_invoke: First time the captain opens the folder, or any time they add a venture.
inputs:
  - venture_name: the human-readable name (e.g. "Acme Coffee")
  - venture_slug: kebab-case slug (e.g. "acme-coffee"). Derived from the name if not given.
  - one_liner: one sentence, under 25 words, on what it is and who it helps
  - target_audience: who it's for (one paragraph)
  - tracking: where its tasks live (Linear, Todoist, Notion, or missions/ only). Optional.
  - shared_or_private: whether the venture's work may go in a shared team tool, or stays private. Optional.
  - first_decision: one decision already made, with the reason. Optional.
outputs:
  - ventures/<slug>/README.md
  - ventures/<slug>/decisions.md
  - ventures/<slug>/_links.md
  - wiki/ventures/<slug>.md
  - index.md (one line added)
  - log.md (one line appended)
---

# command-init: set up a venture

Turns an empty `command` folder (or one with ventures already) into a working
home for one more venture, in about two minutes.

## Step 1: ask

Ask these one at a time, with the example. Keep it light.

1. **Name.** *"What's the venture called?"* Example: `Acme Coffee`
2. **One-liner.** *"In one sentence, under 25 words: what is it, and what does it do for the person who finds it?"* Example: `Acme Coffee roasts small batches and delivers fresh beans to offices every Monday.`
3. **Audience.** *"Who is it for? Describe the person, what they care about, what frustrates them."*
4. **Tracking (optional).** *"Where will its tasks live: Linear, Todoist, Notion, or just missions/ in this folder?"*
5. **Shared or private (optional).** *"Is this work you share with a team in a shared tool, or private to you?"* (If private, its tasks and details never go in a shared workspace. See `docs/tracking-work.md`.)
6. **First decision (optional).** *"One decision you've already made about it, and why?"* Example: `Offices first, not homes, because one office order equals twenty home orders.`

If the captain skips one, write `TKTK (captain to fill in)` and move on. A
placeholder beats a blank.

## Step 2: make the slug

Lowercase, spaces and underscores to hyphens, strip anything that isn't a
letter, number or hyphen, collapse repeated hyphens. `Acme Coffee` becomes
`acme-coffee`. If the result looks odd, confirm it.

If `ventures/<slug>/` already exists, stop and ask. Default: don't overwrite.

## Step 3: create the venture folder

**`ventures/<slug>/README.md`** (start from `templates/venture-readme.md` if it exists):

```markdown
---
type: venture
title: <Venture Name>
description: <one_liner>
status: active
tracking: <tracking, or "missions/">
visibility: <shared | private>
human_in_the_loop: false
created: <YYYY-MM-DD>
---

# <Venture Name>

> <one_liner>

## Current state
Just set up. Nothing shipped yet.

## Who it's for
<target_audience>

## Where things live
- Wiki page: [wiki/ventures/<slug>.md](../../wiki/ventures/<slug>.md)
- Decisions: [decisions.md](./decisions.md)
- Repos, live URLs, tracker project: [_links.md](./_links.md)

## Active missions
*(missions/ files linked here as they're created)*
```

`human_in_the_loop: true` means the agent never sends, posts or publishes
anything for this venture, even with general approval. Set it for anything
sensitive. Default is `false`.

**`ventures/<slug>/decisions.md`:**

```markdown
# <Venture Name> · Decisions

> Append-only. Newest at the bottom. Each entry: what, why, when.

## [<YYYY-MM-DD>] Set up in the command folder
- One-liner: <one_liner>
- Audience: <target_audience>

## [<YYYY-MM-DD>] <first decision, short>      ← only if given
<first_decision, with the reason>
```

**`ventures/<slug>/_links.md`:**

```markdown
# <Venture Name> · Links

## Repos
- *(add when you have one)*

## Live
- *(add live URLs)*

## Tracker
- <tracking>: *(link to the project or board)*
```

## Step 4: create the wiki page

**`wiki/ventures/<slug>.md`** (OKF-compatible frontmatter, see `wiki/README.md`):

```markdown
---
type: venture
title: <Venture Name>
description: <one_liner>
tags: [venture]
status: active
timestamp: <YYYY-MM-DDT00:00:00Z>
created-by: agent
---

# <Venture Name>

<one_liner>

## Key facts
- Audience: <target_audience, one line>
- Status: active since <YYYY-MM-DD>

## Open questions
- TKTK

## Cross-references
- Venture folder: [ventures/<slug>](../../ventures/<slug>/README.md)
- Decisions: [decisions](../../ventures/<slug>/decisions.md)
```

## Step 5: update index.md and log.md

Under `## wiki/ventures/` in `index.md` (create the heading if missing):

```markdown
- <slug>.md — <one_liner>
```

Append to `log.md`:

```markdown
## [<YYYY-MM-DD>] decision | Set up venture <slug> via command-init
```

## Step 6: report

```
Set up <Venture Name>. Created:
  - ventures/<slug>/README.md
  - ventures/<slug>/decisions.md
  - ventures/<slug>/_links.md
  - wiki/ventures/<slug>.md
  - index.md (one line)
  - log.md (one line)

Next: open ventures/<slug>/README.md and add notes. Drop anything about it
into inbox/ and say "process my inbox" when you're ready.
```

## What this skill does not do

- Create code repos or deploy anything.
- Make up content. Everything comes from the captain's answers or a TKTK.
- Validate the idea. That's a separate skill on the roadmap (`validate-idea`).

---

*Skill v0.2 · ships with `command` v0.5*
