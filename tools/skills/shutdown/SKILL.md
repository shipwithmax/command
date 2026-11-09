---
name: shutdown
description: End-of-day shutdown, about 10 minutes. Gathers today's log lines, open missions, overdue items and (if connected) tomorrow's calendar and tracker activity; shows one short brief; takes the captain's brain dump; gives every open item a call; then writes atlas/handoff.md for tomorrow and appends a log line. Use when the captain says "shutdown", "end of day", "wrap up the day", or "EOD".
when_to_invoke: The last thing in the working day.
inputs:
  - the captain's short answers to four questions
outputs:
  - mission and tracker updates
  - new inbox/ captures from the brain dump
  - atlas/handoff.md (overwritten each night)
  - one log.md line
---

# shutdown: close the day, set up tomorrow

The captain is tired. Keep chat short. Gather first, ask once, then do all the
writes in a single pass.

## Step 1: gather (quietly, before saying anything)

From the folder:

- Today's lines in `log.md`.
- Missions in `missions/` touched today, plus everything `in-progress` or
  `blocked`.
- Anything overdue: missions with a `due` date before today that aren't done.
- The current `atlas/handoff.md`, if any (what we said this morning we'd do).

If connected (skip any that aren't, and say so in one line):

- **Calendar:** tomorrow's events.
- **Tracker** (Linear, Todoist, Notion...): items you or the captain changed
  today, and anything due tomorrow.

Never stall on a tool that isn't working. Note it under "Gaps" in the handoff
and keep going.

## Step 2: brief (one message)

- **Done today:** a short list.
- **Still open:** each open mission, one line each.
- **Overdue:** a table with a proposed call for each item.

| Item | Due | Proposed call | Why |
|---|---|---|---|

  Calls: **Do** (tomorrow) · **Re-date** (propose a date) · **Delegate** (to
  whom) · **Drop**. Overdue items never carry over silently.
- **Tomorrow:** fixed commitments, if the calendar is connected.

End with four asks:

1. *"Brain dump: anything rattling around?"*
2. *"One line on each open item?"*
3. *"Calls on the overdue ones? ('ok' takes my proposals)"*
4. *"Tomorrow's first block?"*

## Step 3: apply the answers (one pass)

- **Brain dump** items go where they belong: an action becomes a mission or a
  tracker task, an idea or note becomes an `inbox/` capture, a decision goes in
  that venture's `decisions.md`.
- **Open items:** update each mission's `## Current status` and `## Log`.
- **Overdue calls:** apply them (new due dates, status `dropped`, owner
  changes).
- **Shared vs private:** shared work goes in the shared tool, in clean
  business language. Private work stays in the folder or the captain's
  personal tool. Unclear: keep it private and say so.
- **Anything the captain says not to log: don't write it anywhere.**
- Calendar changes: only on the captain's own calendar, only if asked, and
  never invite other people without asking.

## Step 4: write the handoff

Overwrite `atlas/handoff.md` using `templates/handoff.md`:

```markdown
---
type: handoff
date: <YYYY-MM-DD>
created-by: agent
---

# Handoff for <tomorrow, YYYY-MM-DD>

## First block
<what, which mission, how long>

## Where things stand
- <mission>: <one line> (status)

## Waiting on others
- <who>: <what> (since <date>)

## Don't forget
- <deadline, promise, prep>

## Gaps
- <tools that weren't reachable tonight>
```

Keep it under one screen. Tomorrow's `daily-brief` reads it first.

## Step 5: close

Append to `log.md`:

```
## [YYYY-MM-DD] shutdown | <what changed, short>. Tomorrow: <first block>
```

Then a short recap: what changed (with links to new missions and files),
tomorrow's first block, and anything still waiting on the captain. End with
"Shutdown complete." No follow-up offers.

---

*Skill v0.1 · ships with `command` v0.5*
