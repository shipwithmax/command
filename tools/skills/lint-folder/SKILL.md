---
name: lint-folder
description: Structural health check for the command folder. Finds stray root files, unapproved top-level folders, wiki pages missing from index.md, missing frontmatter, broken source links, missions with no owner or next step, and private work linked to a shared tool. Reports with suggested fixes and only fixes after the captain's OK. Use when the captain says "lint the folder", "health check", "tidy up", or "is the folder in shape?"
when_to_invoke: Weekly, or whenever the folder feels messy.
inputs:
  - none
outputs:
  - a report in chat
  - fixes, only after the captain approves them
  - one log.md line
---

# lint-folder: keep the structure honest

This is the **Lint** operation from `CLAUDE.md`. It reads everything and
changes nothing until the captain says so.

## Checks

Run all of these, then report once.

1. **Root files.** List files at the root. Flag anything that isn't
   `CLAUDE.md`, `AGENTS.md`, `MEMORY.md`, `index.md`, `log.md`, `README.md`,
   `LICENSE`, or a dotfile. Suggest where each stray belongs (when unsure,
   `inbox/`).
2. **Top-level folders.** Flag any folder that isn't `inbox`, `wiki`,
   `ventures`, `missions`, `strategy`, `cadence`, `atlas`, `templates`,
   `tools`, `compute`, `docs`, `archive`, or a dot-folder. A new one needs the
   captain's OK and a line in `log.md` saying why.
3. **Index freshness.** Every page in `wiki/` should have a line in
   `index.md`, and every line in `index.md` should point to a page that
   exists. Report both directions.
4. **Frontmatter.** Every wiki page needs `type`, `title` and `description`.
   Flag pages missing them, and pages whose `timestamp` is older than 6 months
   (possibly stale).
5. **Broken links.** For each wiki page, check that files under
   `## Source material` and relative links still exist. Report `[[wikilinks]]`
   that point at nothing.
6. **Misplaced knowledge.** Look in `ventures/` and `tools/` for long notes that
   read like reference knowledge rather than operating notes. Suggest moving
   them into `wiki/` (keep a link behind).
7. **Missions.** Every file in `missions/` with `status` other than `done`
   needs an `owner` and a next step. If the mission uses a tracker, it needs
   the tracker link. Flag missions untouched for 30+ days.
8. **Shared vs private.** If the captain keeps some ventures private (see
   `visibility:` in each venture README), flag any private mission that links
   to a shared tracker, and any shared-tracker link that names a private
   venture. That's a leak.
9. **Inbox backlog.** Count items in `inbox/` with no `ingest` line in
   `log.md`. More than 20, or anything older than 2 weeks, is worth a
   `process-inbox` run.
10. **Secrets.** Flag any file in the folder whose name looks like a secret
    (`.env`, `*.pem`, `*.key`, `*credentials*`, `*secret*`). Don't open it.
    Just report the path and remind the captain that secrets live outside.
11. **Empty folders.** Report them (except the shipped top-level ones).

## Report

```
## Lint report · YYYY-MM-DD

Clean
- <what passed>

Issues
- [high|medium|low] <what> → suggested fix: <fix>

Stats
- wiki pages: N · index lines: N · missions open: N · inbox new: N
```

High means a leak or a secret-looking file. Medium means something an agent
could trip on (stray root file, broken link, mission with no owner). Low is
cosmetic.

## Fix (after the OK)

Ask: *"Fix the easy ones?"* Easy means moving a stray file, adding a missing
index line, or adding missing frontmatter fields. Show each move before you
make it. For anything that needs judgment, list the options and let the
captain pick. Never delete. Never open a secret-looking file.

## Log

```
## [YYYY-MM-DD] lint | N issues found, M fixed
```

---

*Skill v0.1 · ships with `command` v0.5*
