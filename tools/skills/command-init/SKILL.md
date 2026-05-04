---
name: command-init
description: Bootstrap a freshly-cloned `command` folder with the captain's first venture. Asks 4 questions, populates ventures/, wiki/, log.md, and decisions.md so the folder feels alive within 5 minutes of cloning.
when_to_invoke: First time the captain opens the folder, or any time they want to add a new venture to an existing folder. The captain will say something like "run the command-init skill" or "set up my first venture" or "add a new venture to my command folder."
inputs:
  - venture_name: string — the human-readable name (e.g. "Recovery Stack")
  - venture_slug: string — the kebab-case slug (e.g. "recovery-stack"). Auto-derive from venture_name if not provided.
  - one_liner: string — one sentence under 25 words describing what this venture is.
  - target_audience: string — who this is for (one paragraph).
  - first_decision: string (optional) — one decision the captain has already made about this venture, with reasoning.
outputs:
  - ventures/<slug>/README.md — venture home
  - ventures/<slug>/decisions.md — append-only decisions log, seeded with first_decision if provided
  - ventures/<slug>/_links.md — placeholder for GitHub repos, deployed URLs, related docs
  - wiki/ventures/<slug>.md — richer wiki entry cross-linking to the venture folder
  - log.md — appended with a one-line entry recording the venture creation
  - index.md — updated to include the new wiki entry
---

# command-init — bootstrap your first venture

A Claude Skill for `command`. The captain runs this once per venture, ideally on Day 1 of using the folder.

## What it does

Turns a freshly-cloned (and otherwise empty) `command` folder into a populated, working knowledge base in 2 minutes. Specifically:

1. Asks the captain 4 short questions about the venture they want to add
2. Creates `ventures/<slug>/` with three files (`README.md`, `decisions.md`, `_links.md`)
3. Creates `wiki/ventures/<slug>.md` cross-linking to the venture folder
4. Appends one line to `log.md` recording the creation
5. Updates `index.md` to include the new wiki entry
6. Reports back what was created with paths the captain can open

## How Claude executes this skill

When the captain invokes the skill (any phrasing — "run command-init", "set up my first venture", "add a venture", etc.), Claude follows this script:

### Step 1 · Gather inputs

Ask, in order, with examples:

1. **Venture name** — *"What's the human-readable name of this venture?"* Example: `Recovery Stack`
2. **One-liner** — *"In one sentence under 25 words, what is it and what does it do for someone who finds it?"* Example: `Recovery Stack is a guided recovery protocol library for athletes — picks the right protocol for tonight based on yesterday's training load.`
3. **Target audience** — *"Who is this for? One paragraph — describe the person, what they care about, what they're frustrated by."*
4. **First decision (optional)** — *"What's one decision you've already made about this venture, and why?"* Example: `Going to focus on HYROX athletes first because that's where I have direct insight and the community is small enough to get to know.`

If the captain skips any answer, fill it with `TKTK — captain to fill in` and proceed. The folder is more useful with placeholders than with nothing.

### Step 2 · Derive the slug

From the venture name, derive a kebab-case slug:
- Lowercase
- Replace spaces and underscores with hyphens
- Strip non-alphanumeric characters except hyphens
- Trim consecutive hyphens

Example: `Recovery Stack` → `recovery-stack`. Confirm with the captain if the slug looks weird.

### Step 3 · Create the venture folder

Create `ventures/<slug>/` with three files:

**`ventures/<slug>/README.md`:**

```markdown
---
type: venture
slug: <slug>
status: active
created: <YYYY-MM-DD>
---

# <Venture Name>

> <one_liner>

## What this is

<one_liner expanded into 2-3 sentences if helpful, otherwise just the one-liner>

## Who it's for

<target_audience>

## Where things live

- **Wiki entry (richer context):** [wiki/ventures/<slug>.md](../../wiki/ventures/<slug>.md)
- **Decisions log:** [decisions.md](./decisions.md)
- **Repos + deployed URLs:** [_links.md](./_links.md)

## Active missions

*(missions/ files linked here as they get created)*

## Notes

*(captain adds free-form notes here over time)*
```

**`ventures/<slug>/decisions.md`:**

```markdown
# <Venture Name> · Decisions

> Append-only. New entries at the bottom. Each entry: what + why + when.

## [<YYYY-MM-DD>] Created venture in command folder

Bootstrapped via `command-init` skill. Initial framing:
- One-liner: <one_liner>
- Target audience: <target_audience>

<if first_decision provided>
## [<YYYY-MM-DD>] <first decision summary>

<first_decision expanded>
</if>
```

**`ventures/<slug>/_links.md`:**

```markdown
# <Venture Name> · Links

External resources, repos, deployed URLs, related accounts.

## GitHub

- *(add repo URL when you have one)*

## Deployed

- *(add live URLs when you have them)*

## Related

- *(add related Notion pages, Linear projects, etc.)*
```

### Step 4 · Create the wiki entry

**`wiki/ventures/<slug>.md`:**

```markdown
---
type: wiki-entry
entity_type: venture
slug: <slug>
created: <YYYY-MM-DD>
---

# <Venture Name>

> <one_liner>

## Audience

<target_audience>

## Status

Active. Created <YYYY-MM-DD> via `command-init`.

## Cross-references

- **Venture folder:** [[ventures/<slug>]]
- **Decisions:** [[ventures/<slug>/decisions]]

## Open questions

*(things the captain hasn't decided yet — append as they come up)*

- TKTK
```

### Step 5 · Append to `log.md`

Append a single line to `log.md`:

```markdown
## [<YYYY-MM-DD>] decision | Created venture <slug> via command-init skill
```

### Step 6 · Update `index.md`

Add the new wiki entry under `## wiki/ventures/`:

```markdown
- <slug>.md — <one_liner>
```

If the section doesn't exist yet, create it.

### Step 7 · Report back

Print a confirmation to the captain like:

```
✓ Bootstrapped `<venture-name>`. Created:
  • ventures/<slug>/README.md
  • ventures/<slug>/decisions.md
  • ventures/<slug>/_links.md
  • wiki/ventures/<slug>.md
  • log.md (one line appended)
  • index.md (updated)

Open ventures/<slug>/README.md to start adding notes. The wiki entry at
wiki/ventures/<slug>.md is the place for richer context as you accumulate it.

Run command-init again any time you want to add another venture.
```

## What this skill does NOT do

- Doesn't create code repos. The captain links existing GitHub repos in `_links.md` after creation.
- Doesn't deploy anything. This is a knowledge-base bootstrap, not an infrastructure spin-up.
- Doesn't fill in real content. Every value is what the captain gives + sensible TKTK placeholders for what they skip.
- Doesn't run for clients. There's a sibling skill called `client-init` (TKTK — to be added in v0.4) for paid engagements with different shape (`access-map.md`, billing context, etc.).

## Re-running this skill

Safe to run multiple times. Each invocation creates a new venture. The skill checks if `ventures/<slug>/` already exists and asks the captain to confirm before overwriting (default: don't overwrite).

## Where this fits in the curriculum

If you're a MaxShip student, this is the natural step after cloning the `command` folder on Day 1. The `command-init` skill turns the empty template into your project's real Command layer in one prompt.

---

*Skill v0.1 · ships with `command` v0.3*
