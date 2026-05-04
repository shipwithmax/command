# tools/skills/

**Claude Skills** — packaged AI workflows your captain can invoke.

Each skill is a self-contained directory with a `SKILL.md` manifest. The captain says something like *"run the X skill"* or *"use X to do Y"*, and Claude (or any AI tool with filesystem access) reads the SKILL.md and executes the workflow.

## Shipped skills

| Skill | What it does | Run when |
|---|---|---|
| [`command-init`](./command-init/) | Bootstrap a venture in the folder. Asks 4 questions, creates `ventures/<slug>/` + `wiki/ventures/<slug>.md` + log entry + index update. | First time you use the folder, or any time you add a new venture. |

## Roadmap (next versions)

| Skill | Ships in | What it'll do |
|---|---|---|
| `client-init` | v0.4 | Same as `command-init` but for paid client engagements — adds `access-map.md`, billing context, scope notes |
| `ingest-meeting` | v0.4 | Drop a meeting transcript or voice note in `raw/meeting-logs/`, get a structured wiki entry + log line + cross-reference auto-built |
| `daily-brief` | v0.5 | Generate a morning brief from yesterday's `log.md`, active ventures, and pending missions. Reads, summarizes, asks the captain 5–10 questions. |
| `lint-folder` | v0.5 | Structural health check — finds files in wrong places, orphan wiki pages, missions missing PM links. Reports with suggested fixes. |
| `deploy-worker` | v0.6 | Spin up a Cloudflare Worker from a `ventures/<name>/worker/` directory. Runs wrangler deploy + logs the URL. |

## Anatomy of a skill

```
tools/skills/<skill-name>/
├── SKILL.md              ← The manifest. AI reads this first.
├── templates/            ← Optional: reusable templates the skill instantiates
├── prompts/              ← Optional: sub-prompts for multi-step workflows
└── examples/             ← Optional: example inputs + outputs for reference
```

The `SKILL.md` manifest has YAML frontmatter:

```yaml
---
name: skill-name
description: One-sentence summary of what this skill does
when_to_invoke: When the captain should use it (and how they'll phrase the ask)
inputs: List of inputs the skill needs (with examples)
outputs: List of files the skill creates or modifies
---
```

Then markdown body explaining how Claude executes the skill step-by-step.

## Adding your own

Create `tools/skills/<your-skill-name>/SKILL.md` following the pattern above. Claude will pick it up automatically the next time the captain invokes a skill — Claude reads the `tools/skills/` directory to find available skills and matches the captain's request to the closest one.

Keep skills:
- **Single-purpose.** One skill = one workflow.
- **Self-contained.** All instructions in the SKILL.md. Don't make the captain hunt for context.
- **Idempotent.** Safe to run multiple times. Always confirm before overwriting.
- **Reportable.** End with a clear "here's what was created" summary.

---

*v0.1 · ships with `command` v0.3*
