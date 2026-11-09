# missions/

**Active work.** One file per piece of work that has an outcome: a launch, a
proposal, a fix, a hire. Start each one from
[`templates/mission.md`](../templates/mission.md), or let the `focus` skill
draft it for you.

## With or without a tracker

- **You use a tracker** (Linear, Todoist, Notion): the tracker is the record.
  Put the ticket ID or link in the mission's `tracker:` field. The mission file
  holds what the tracker doesn't: decisions, links to inbox material,
  half-formed ideas.
- **You don't:** leave `tracker:` empty. The mission file plus `log.md` is the
  record. That's a complete system.

Either way, a good mission says **what**, **why**, **what done looks like**,
the **current status**, and the **next step** with an owner.

## Statuses

`todo` · `in-progress` · `blocked` · `paused` · `done` · `dropped`

The `daily-brief`, `shutdown` and `lint-folder` skills read them. Overdue
missions get a call every evening: do, re-date, delegate or drop.

## Naming

`missions/<short-slug>.md`, e.g. `missions/acme-menu-page.md`. Add the ticket
ID if there is one: `missions/acme-42-menu-page.md`.

## Privacy

This folder is gitignored in the public kit (except this README), because it
fills up with real work. If your copy is a **private** repo, remove the
`missions/*` lines from `.gitignore` so your missions are backed up.

More: [`docs/tracking-work.md`](../docs/tracking-work.md).
