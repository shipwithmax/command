---
name: focus
description: Bind this work session to one mission (or tracker ticket) and keep a one-line focus footer on every reply, so the captain and the agent stay on the same task. Handles a small stack of open tasks, and only switches on an explicit instruction. Use when the captain says "focus on X", "start X", "switch to X", "also start X", "pause X", "done with X", or "what am I on?"
when_to_invoke: At the start of any real work session, and whenever the captain switches tasks.
inputs:
  - optional: a hint (mission slug, ticket ID, or a few words about the work)
outputs:
  - a focus footer on each reply
  - mission status updates (in-progress, paused, done)
  - one log.md line when a task is done
---

# focus: one session, one task, out loud

Sessions drift. A focus footer keeps the current task visible, and makes a
switch a decision instead of an accident.

## Step 1: figure out the task

Use the cheapest signals first:

1. The hint, if given (a mission slug, a ticket ID, or a description).
2. Where you are: the folder, the git branch name, the venture.
3. What the captain has been asking about in this conversation.

Look for a matching open mission in `missions/` (or ticket in the captain's
tracker). Then:

- **Match found:** *"Looks like `menu-refresh`: new seasonal menu for Acme
  Coffee. That one?"* Wait for a yes.
- **No match:** draft a mission from `templates/mission.md` (what, why, what
  "done" looks like), show it, and create it on a yes.
- **Unclear which venture, or whether it's shared or private work:** ask once.
  Don't guess.

Set the mission's `status` to `in-progress`.

## Step 2: keep the footer

End every reply with one line:

```
Focus: Hands-on · menu-refresh (since 2:15pm, ~35m)
```

- **Mode first.** Name the *type* of work: Hands-on, Research, Writing, Comms,
  Decisions, Admin. Switching between types of work costs more than switching
  between projects, so the footer helps you batch by mode.
- **Elapsed time** is recomputed each reply from when the task started. It
  updates when you reply. It doesn't tick live.
- **Several tasks in the same mode** can share the line:
  `Focus: Comms · investor-update · supplier-reply (since 2:15pm, ~35m)`
- **Parked count** (optional): `· parked: 3` for open tasks in other modes.
  Don't list them unless asked.

No task bound yet? No footer.

## Step 3: handle switches (explicit only)

Keep a small stack: task, title, start time.

| Captain says | You do |
|---|---|
| "start X" / "focus on X" | X becomes the main task |
| "also start X" | add X, keep the current main task |
| "switch to X" | X becomes main, the rest stay open |
| "pause X" | take X off the stack, set its status to `paused`, note where it stopped |
| "done with X" | take X off the stack and run the wrap-up below |

**Never switch because the conversation drifted.** If the topic changes, keep
the footer as is. If it looks like a real switch, ask: *"Switch focus to Y?"*

## Wrap-up when a task is done

1. Add a short summary to the mission's `## Log`: what was done, what was
   decided, links to what was made.
2. Set `status: done`.
3. Repo work: make sure there's a pull request that names the mission or
   ticket. Folder work: there is no PR, the mission file is the record.
4. Append to `log.md`: `## [YYYY-MM-DD] ship | <mission>: <one line>`

## Other tools

This file is plain text. In a tool without skills, paste it in as the first
message and you get the same behavior by hand.

---

*Skill v0.1 · ships with `command` v0.5*
