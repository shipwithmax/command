---
name: process-inbox
description: Process the inbox. Reads new captures in inbox/ (notes, transcripts, PDFs, clips), proposes where each one's knowledge goes, and after the captain's OK writes wiki pages, missions and decisions, updates index.md and logs it. Never edits the originals. Use when the captain says "process my inbox", "file my captures", "ingest this", or "sort the inbox".
when_to_invoke: When inbox/ has new material. Weekly at minimum.
inputs:
  - optional: a single file or subfolder to process instead of the whole inbox
outputs:
  - new or updated wiki/ pages
  - new missions/ files for action items (or tasks in the captain's tracker)
  - decision entries in ventures/<slug>/decisions.md
  - index.md and log.md updates
---

# process-inbox: turn captures into knowledge

This is the **Ingest** operation from `CLAUDE.md`, as a step-by-step ritual.

## Ground rules

- **Never edit or delete an original.** A transcript or PDF is a record. Your
  summary goes in `wiki/`, and it cites the original.
- **Propose first, write second.** Show the plan in one table, get the
  captain's OK (or edits), then write everything in one pass.
- **Respect consent and privacy.** If a capture is marked private, off the
  record, or "don't file", leave it alone and say so. Don't copy personal
  remarks about people into shared places.
- **Skip files that are still changing.** If a file was modified in the last
  10 minutes, it may still be syncing or recording. List it as "skipped, still
  changing" and move on.
- **Ask once when it's unclear** which venture something belongs to, or
  whether it's shared or private work. Don't guess.

## Step 1: find what's new

List everything in `inbox/` (including subfolders). An item is **new** if no
`ingest` line in `log.md` names it. If the captain named a file, process only
that one.

If nothing is new, say so in one line and stop.

## Step 2: read and propose

Read each new item. For each one, decide:

- **What it is**, in a few words.
- **Takeaways**: the 1 to 3 things worth keeping.
- **Where they go**: an existing wiki page to update (preferred), or a new
  page in `wiki/ventures/`, `wiki/people/` or `wiki/concepts/`.
- **Action items**: who, what, by when. Each becomes a mission file, or a task
  in the captain's tracker if one is set for that venture.
- **Decisions**: anything decided, with the reason. Each becomes an entry in
  that venture's `decisions.md`.

Show one table:

| Item | Takeaways | Goes to | Actions | Decisions |
|---|---|---|---|---|

Then ask: *"OK to file these? Edit anything first?"*

For meeting transcripts, also pull out: decisions, owners, commitments,
deadlines and open questions. A raw transcript alone is not task tracking.

## Step 3: write (after the OK)

For each item:

1. **Wiki.** Create or update the page. Use the frontmatter in
   `wiki/README.md` (`type`, `title`, `description`, `tags`, `timestamp`).
   Set `timestamp` to now. Add the original under `## Source material`. Keep
   every existing `[[wikilink]]` working.
2. **Actions.** Create `missions/<slug>.md` from `templates/mission.md`, or
   create the task in the tracker and link it from the mission. Every action
   gets an owner and a next step. No orphans.
3. **Decisions.** Append to `ventures/<slug>/decisions.md`. Never rewrite old
   entries.
4. **Index.** Add any new wiki page to `index.md`.
5. **Log.** One line per item:
   `## [YYYY-MM-DD] ingest | <file name> → <where it went>`

## Step 4: tidy (ask first)

Ask whether to leave the processed originals in `inbox/` or move them to
`archive/inbox/YYYY-MM/`. Either is fine. The `ingest` lines in `log.md` are
what mark them as done.

## Step 5: report

```
Processed N items (skipped M: still changing / private).
  - wiki: <pages created or updated>
  - missions: <new missions or tasks>
  - decisions: <entries added>
Left in inbox/: <anything you didn't touch, and why>
```

---

*Skill v0.1 · ships with `command` v0.5*
