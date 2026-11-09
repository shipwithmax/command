# templates/

Reusable patterns. Start a new note from one of these instead of a blank page.
They use Obsidian's core Templates syntax (`{{title}}`, `{{date}}`), so they
work in Obsidian out of the box. Your AI uses them too.

## Shipped templates

| Template | Use it for |
|---|---|
| [`mission.md`](./mission.md) | A piece of work with an outcome: context, what done looks like, current status, next step, log. |
| [`venture-readme.md`](./venture-readme.md) | The home page of a new `ventures/<name>/` folder. |
| [`decision.md`](./decision.md) | One entry in a venture's append-only `decisions.md`. |
| [`meeting-note.md`](./meeting-note.md) | A meeting: decisions, commitments, open questions, next step. |
| [`wiki-page.md`](./wiki-page.md) | A new `wiki/` page, with OKF-compatible frontmatter. |
| [`person.md`](./person.md) | A `wiki/people/` page. |
| [`daily-note.md`](./daily-note.md) | A daily note, if you keep them. |
| [`handoff.md`](./handoff.md) | The nightly handoff the `shutdown` skill writes to `atlas/handoff.md`. |

## Turn them on in Obsidian

Settings → Core plugins → Templates → on. Set the template folder to
`templates`. Then use the "Insert template" command in any new note.

## Two fields worth keeping

- **`created-by:`** (`captain` or `agent`). When an AI writes half your notes,
  it helps to see at a glance who started what.
- **`status:`** on missions and ventures. It's what the `daily-brief`,
  `shutdown` and `lint-folder` skills read.

## Pattern

Templates are starting points, not contracts. Edit them as you learn what your
business needs. If you write the same structure three times, make it a
template.
