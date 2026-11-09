---
name: daily-brief
description: Morning kickoff. Reads last night's atlas/handoff.md first, then recent log.md lines, active and overdue missions, this quarter's rocks and (if connected) today's calendar. Shows one short brief, asks a few questions, and helps the captain pick the first block, then starts focus on it. Use when the captain says "brief me", "morning", "start the day", "what's on today?", or "daily brief".
when_to_invoke: The first thing in the working day.
inputs:
  - the captain's short answers
outputs:
  - a brief in chat
  - mission status updates
  - one log.md line
---

# daily-brief: start from where you left off

The point is to know the shape of the day before you start, in five minutes,
without re-reading everything.

## Step 1: gather (quietly)

In this order:

1. **`atlas/handoff.md`.** Read it first. Note its date. If it's older than
   yesterday, say so: some of it may be stale.
2. **`log.md`:** the last two days of lines.
3. **`missions/`:** everything `in-progress` or `blocked`, plus anything due
   today or overdue.
4. **`strategy/quarterly-rocks.md`:** the current rocks, so today's work can be
   checked against them.
5. **`cadence/daily.md`:** the captain's own morning checklist, if they've
   edited it.

If connected (skip any that aren't, and say so in one line):

- **Calendar:** today's events.
- **Tracker:** items due today or assigned overnight.

## Step 2: brief (one message)

- **From last night:** the handoff's first block and "don't forget" items.
- **Today's fixed commitments:** meetings and deadlines.
- **Open work:** one line per active mission.
- **Overdue:** each one with a proposed call (Do / Re-date / Delegate / Drop).
- **Top 3 candidates for today**, ranked, one line of why each. Prefer work
  that moves a quarterly rock. Flag anything that doesn't.

Then ask up to three short questions, for example:

1. *"Still the right first block?"*
2. *"Calls on the overdue items? ('ok' takes my proposals)"*
3. *"Anything new since last night?"*

## Step 3: apply and start

- Apply the overdue calls and any status changes.
- Capture anything new into `inbox/` or a mission.
- Start the **focus** skill on the first block, so the session is bound to it.

## Step 4: log

```
## [YYYY-MM-DD] brief | First block: <mission>. Top 3: <a>, <b>, <c>
```

Keep the whole thing short. If the captain says "just tell me", skip the
questions and give the brief plus your proposed first block.

---

*Skill v0.1 · ships with `command` v0.5*
