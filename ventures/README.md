# ventures/

Things you own. One folder per venture.

## Per-venture structure

```
ventures/<name>/
├── README.md          ← what this is, current state, key contacts (entry point)
├── timeline.md        ← chronological log — every meaningful event, append-only, dated
├── decisions.md       ← append-only log of architectural / strategic decisions (the *why*)
├── _links.md          ← URLs to external resources (GitHub repos, dashboards, comms channels)
└── notes/             ← working notes, brainstorms, scratch
```

`README.md` is the only mandatory file. Add others as content accumulates.
Start it from [`templates/venture-readme.md`](../templates/venture-readme.md), or
let the `command-init` skill set the whole folder up.

## Three lines every venture README should have

```yaml
tracking: missions/        # or Linear, Todoist, Notion: where its tasks live
visibility: private        # or shared: may its work go in a team's shared tools?
human_in_the_loop: false   # true = the agent never sends, posts or publishes for it
```

Your AI reads these to route work on its own: where to file a task, what may
never appear in a shared workspace, and where to be extra careful. See
[`docs/tracking-work.md`](../docs/tracking-work.md).

## Code lives elsewhere

Project code lives in dedicated GitHub repos per venture, linked from `_links.md`. This folder holds the **operational context** — decisions, timeline, contacts, notes — that doesn't belong in code.

## When a venture is done or paused

Move it to `archive/ventures/` with a short closeout note in its `README.md` describing: when archived, why, what was delivered, what the relationship looks like going forward.
