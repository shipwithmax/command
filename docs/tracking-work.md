# Tracking work: one record, two tracks, no leaks

> The short version lives in [`CLAUDE.md`](../CLAUDE.md). This doc covers the
> how and the why.

Your AI forgets everything between sessions. The folder doesn't. Tracking is
how work survives the gap: between today and tomorrow, between you and an
agent, between one agent and the next.

## One source of truth per kind of work

Pick one place that is *the* record for each kind of work, and say which in
each venture's README (`tracking:`).

- **With a tracker** (Linear, Todoist, Notion, a GitHub project): the tracker
  is the record. The mission file in `missions/` is a thin page that links to
  the ticket and holds the context the tracker doesn't: decisions, links to
  inbox material, half-formed ideas.
- **Without a tracker:** the mission file plus `log.md` is the record. That's a
  complete system on its own. Many solo operators never need more.

It's fine to mix: a shared tracker for team work, mission files for your own.
What's not fine is the same task living in two places with two different
statuses.

A good record has: **what** is being done, **why**, **what "done" looks
like**, the **current status**, and the **next step** with an owner. The
mission template has all five.

## Two tracks of work

Figure out which track you're on before you start.

### Track A: repo work (inside a git repo)

- Branch named after the work: `yourname/acme-42-menu-page`, or
  `yourname/menu-page` if there's no ticket.
- Pull request with the ticket or mission in the title: "ACME-42: Add menu page".
- The agent opens the PR. You merge. See
  [`agent-autonomy.md`](./agent-autonomy.md).

### Track B: folder work (notes, research, docs, ops)

Most business work isn't code. It lives as documents in this folder or your
file storage.

- No branch, no PR, no commit ceremony. Don't make a git repo just to track a
  document.
- The mission (or ticket) *is* the tracking artifact. Update its status and log
  as you go, add a summary when done, and mark it done yourself. Nothing moves
  it for you.

## Keep shared and private apart

If you share a tracker or workspace with a team, it's a shared space. Only that
team's work goes there.

- **Private work** (side ventures, personal matters, family, health, money)
  stays in this folder or a personal tool.
- **No leakage.** Shared titles, descriptions, comments, branch names and PR
  titles never mention private ventures, their clients, or personal details.
  Not even as background ("this replaces the old brief for my other thing").
- **Unclear? Ask once** before filing anywhere. A leaked private detail in a
  shared tool is worse than one extra question.
- **Personal remarks about people** never go in shared places. Keep factual
  notes factual.

Mark each venture's README with `visibility: shared` or `visibility: private`
so the agent can route on its own. The `lint-folder` skill flags leaks.

## Link the exact file, both ways

When a task points at a document, link the document itself.

- Never a bare file name or a folder when you mean a file. "See the proposal"
  is a scavenger hunt. A link is not.
- Link both ways: the ticket links the file, and the file names its ticket or
  mission.
- When you ask someone to contribute, put the link right next to the ask, and
  say which section.
- If the file doesn't exist yet, write **Link pending**, and replace it before
  you hand the task to anyone.
- Use the access you already have (team or private). Never create a public or
  anyone-with-the-link share without asking first.

## Sessions: start, during, end

- **Start.** Read `atlas/handoff.md` if it exists. Check active missions and the
  tracker. Bind the session to one task (the `focus` skill does this).
- **During.** Add decisions, findings and blockers to the mission as they
  happen, not at the end. If the scope changes, write it down.
- **End.** Leave enough context that someone else could continue cold. For
  research, put the findings in the mission or a wiki page before you close it.

## The daily loop

| When | Skill | What happens |
|---|---|---|
| Morning | `daily-brief` | Reads last night's handoff, briefs the day, picks the first block |
| While working | `focus` | Keeps a one-line footer: mode, task, time on it. Switches only when you say so |
| Evening | `shutdown` | Short brief, brain dump, a call on every open item, writes `atlas/handoff.md` |

The handoff is the bridge. It's one screen: tomorrow's first block, where
things stand, who you're waiting on, what not to forget. It's overwritten each
night. `log.md` keeps the permanent record.

**Every overdue item gets a call:** Do, Re-date, Delegate or Drop. Nothing
carries over silently. That one habit does more for a backlog than any tool.

## Meetings and context

Capturing context is half the value of this folder. Meetings are where most of
it is created.

- **Consent first.** Record or transcribe only when everyone knows and has
  agreed. If part of a conversation is off the record, leave it out of every
  copy, summary and draft.
- **File the raw material** in `inbox/meeting-logs/YYYY-MM-DD-topic.md`.
- **Pull out what matters** into a meeting note (`templates/meeting-note.md`):
  decisions, owners, commitments, deadlines, open questions. Then turn each
  commitment into a mission or a tracker task.
- **A raw transcript alone is not task tracking.** Nobody rereads transcripts.
- **No orphans.** Every meeting record or deliverable that matters should have
  a venture, an owner and a next action. Connect related people, files, notes
  and decisions with links, so a future you (or a future agent) can
  reconstruct why something happened.
