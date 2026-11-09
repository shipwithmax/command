# Agent autonomy: what your AI may do on its own

> The short version lives in [`CLAUDE.md`](../CLAUDE.md). This doc explains the
> reasons, so you can tune the tiers to your business.

An AI agent that has to ask about everything is slow. One that asks about
nothing is dangerous. The fix is to sort actions by **how hard they are to
undo** and **whether they reach other people**, then give each group a rule.

## The three tiers

### Green: just do it

Things that stay inside your folder or your machine, and are easy to undo.

- Reading the folder (except secrets)
- Writing and editing notes, wiki pages, missions and drafts
- Updating `index.md`, `log.md` and mission status
- Research: web searches, reading docs, read-only analysis
- Writing code on a feature branch, and committing there after checking the diff
- Building small local tools to help with research

The folder keeps history (git, or your sync tool's version history), so a bad
edit is a cheap fix.

### Yellow: ask once per session, then go

Things that are a bit harder to undo, or that change how your setup behaves.

- Pushing a feature branch
- Installing packages, changing build scripts or scheduled jobs
- Running a build that doesn't deploy
- Reading from a live database
- Adding a root file or a top-level folder
- Filing work when it's unclear which venture it belongs to

"Once per session" keeps you in the loop without forty prompts an hour.

### Red: always ask, every time

Things that reach other people, change what's live, cost money, or can't be
undone.

- **Sending or publishing anything.** Email, messages, social posts, comments
  in shared tools. The agent drafts. You send.
- Deploying, merging a pull request, pushing to `main`
- Deleting things, writing to a live database, running migrations
- Spending money, signing up for services
- Touching secrets, environment variables, security settings, hooks, or
  `CLAUDE.md` itself
- Sending folder content to any outside service you didn't set up on purpose

### Ventures that are always human-in-the-loop

Some work is too sensitive for any automation: a partnership in a delicate
stage, a community you're careful with, anything legal. Mark that venture's
README with `human_in_the_loop: true`. The agent can still draft and research,
but every external action for it is red, even if you've given general approval
elsewhere.

## Agents propose, humans merge (production gates)

If pushing to `main` deploys your site or app, then the deploy gate has to live
somewhere the agent can't just walk past. The best place is git itself.

For every repo an agent can push to:

1. **Protect `main`.** No direct pushes, from anyone, including you.
2. **Pull requests only.** The agent works on a branch and opens a PR. You
   read the diff and merge.
3. **Required checks.** At least lint and typecheck. Tests if you have them.
4. **No force pushes to `main`.** Ever.
5. **Deploy only from `main`.** And `main` only changes through a merged PR.

The PR is the seam between "the AI suggested this" and "this is live in front
of customers." Name the mission or ticket in the branch and the PR title so the
work is traceable.

Solo and no second reviewer? Still use the PR. Read the diff in a different
window from the one the agent works in. The pause is the point.

**Your command folder is usually the exception.** Nothing deploys from it, and
committing notes straight to `main` is fine. If that's your setup, write it
into `CLAUDE.md` so the agent knows the exception is on purpose.

## Log sensitive actions

Keep a record of what the agent tried that touched the red tier: blocked
commands, pushes, deploys. You'll rarely read it. When something goes wrong,
you'll be glad it's there. The optional guard hook in
[`tools/hooks/`](../tools/hooks/) writes this log for you, outside the folder,
with tokens masked.

## Enforce, don't just ask

Rules in `CLAUDE.md` work most of the time. For the few things that must never
happen, add enforcement:

| Layer | What it does | Where |
|---|---|---|
| Rules in `CLAUDE.md` | The agent reads and follows them | always on |
| Tool permissions | Your AI tool refuses certain reads or commands | e.g. Claude Code `permissions.deny` |
| Hooks | A script checks each action before it runs | [`tools/hooks/`](../tools/hooks/) (optional) |
| Git branch protection | `main` can't change without a merged PR | your git host's settings |
| Platform secrets | Deployed code reads keys the agent can't see | [`docs/secrets.md`](./secrets.md) |

Start with the first row. Add the others as the agent does more for you.

## Tuning the tiers

- **Too many prompts?** Move a yellow item to green, or a red one to yellow,
  and write it in `CLAUDE.md`. Be specific: "pushing branches in the acme-coffee
  repo is green" beats "pushing is fine."
- **Something went wrong?** Move it up a tier, and add a line to `MEMORY.md` or
  `CLAUDE.md` about what happened, so it doesn't repeat.
- **Review monthly.** It's on the checklist in
  [`cadence/monthly.md`](../cadence/monthly.md).
