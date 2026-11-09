# tools/skills/

**Skills** are packaged AI workflows you invoke by name.

Each skill is a folder with a `SKILL.md` file. You say *"run the X skill"* (or
just describe a task that matches one), and your AI reads the `SKILL.md` and
follows it step by step. It's plain markdown, so any AI tool with file access
can run it.

## Shipped skills

| Skill | What it does | Run it when |
|---|---|---|
| [`command-init`](./command-init/) | Sets up a venture: asks a few questions, creates `ventures/<slug>/`, a wiki page, an index line and a log line. | Day one, and any time you add a venture. |
| [`process-inbox`](./process-inbox/) | Turns new `inbox/` captures into wiki pages, missions and decisions. Never edits the originals. | When `inbox/` has piled up. *"Process my inbox."* |
| [`lint-folder`](./lint-folder/) | Structural health check: stray root files, orphan wiki pages, missing frontmatter, stale links, missions with no next step. | Weekly, or when the folder feels messy. |
| [`daily-brief`](./daily-brief/) | Morning kickoff: reads last night's handoff, recent log lines and active missions, then helps you pick the first block. | Start of the day. |
| [`focus`](./focus/) | Binds a work session to one mission and keeps a one-line focus footer, so you and the agent stay on the same task. | Start of any real work session. |
| [`shutdown`](./shutdown/) | End of day: one short brief, your brain dump, every open item gets a call, then it writes `atlas/handoff.md` for tomorrow. | End of the day. |

The last three form a loop: **brief** in the morning, **focus** while you
work, **shutdown** at night. Tomorrow's brief starts from tonight's handoff.

## Roadmap

| Skill | What it'll do |
|---|---|
| `validate-idea` | Take a rough idea, run competitor and market research, and draft a spec and a waitlist-test plan into `ventures/<slug>/`. |
| `weekly-prep` | Run the weekly prep in [`cadence/weekly.md`](../../cadence/weekly.md) as a guided ritual. |
| `deploy-worker` | Deploy a Cloudflare Worker from `ventures/<name>/worker/`, with the captain approving the deploy step. |

## Make them native slash commands (Claude Code, optional)

The skills work as is: `CLAUDE.md` tells your agent where they live. If you use
Claude Code and want them in the `/` menu too, link them into `.claude/skills/`
from the root of your folder:

```bash
mkdir -p .claude/skills
for d in tools/skills/*/; do
  ln -s "../../$d" ".claude/skills/$(basename "$d")"
done
```

Now `/shutdown`, `/focus` and the rest show up as commands. The files stay in
`tools/skills/`, so other tools still find them.

## Anatomy of a skill

```
tools/skills/<skill-name>/
├── SKILL.md              ← the manifest. The AI reads this first.
├── templates/            ← optional: files the skill fills in
└── examples/             ← optional: example inputs and outputs
```

`SKILL.md` starts with YAML frontmatter:

```yaml
---
name: skill-name
description: What it does and when to use it, including the phrases you'd say.
when_to_invoke: When the captain should use it
inputs: What the skill needs
outputs: Files the skill creates or changes
---
```

Then a markdown body with the steps. `name` and `description` are what Claude
Code reads. The other fields are for you and for other tools.

## Adding your own

Create `tools/skills/<your-skill-name>/SKILL.md` following the pattern above.
Your AI looks in `tools/skills/` whenever you ask for a skill.

Keep skills:

- **Single-purpose.** One skill, one workflow.
- **Self-contained.** All instructions in the `SKILL.md`.
- **Safe to re-run.** Confirm before overwriting anything.
- **Inside the autonomy tiers.** A skill never sends, publishes, deploys or
  deletes without the captain's OK (see [`docs/agent-autonomy.md`](../../docs/agent-autonomy.md)).
- **Reportable.** End with a short "here's what changed" summary.

A good source of new skills: anything you've asked your AI to do three times.

---

*Skills index v0.5 · ships with `command` v0.5*
