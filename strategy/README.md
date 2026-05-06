# strategy — the captain's slow-cadence job

> The framework for setting direction. Pairs with the Strategic cadence
> (quarterly + yearly) defined in [`cadence/`](../cadence/).

## What lives here

- **[objectives.md](./objectives.md)** — your active strategic objectives. The 3 things this quarter that matter.
- **[quarterly-rocks.md](./quarterly-rocks.md)** — the rocks template. Big projects scoped to a quarter.
- **[annual-themes.md](./annual-themes.md)** — the year's frame. Direction, not goals.
- **[monthly-review.md](./monthly-review.md)** — the questions you ask yourself monthly to check direction.

## Strategy ≠ task list

Strategy is **the captain's slow-cadence job.** It's where you decide what your business is *for* — not what shipped this week. The slow rhythms (quarterly, yearly) are where the strategic muscle lives. The fast ones ([daily](../cadence/daily.md), [weekly](../cadence/weekly.md)) execute on whatever direction you set here.

Most operators skip strategy because the daily ship-loop feels productive. Three weeks later they realize they've been running the wrong direction faster.

## How to use this folder

1. **At year start** — fill in `annual-themes.md`. One frame. Not a goal, a direction.
2. **At quarter start** — fill in `quarterly-rocks.md`. 3 rocks max. Each rock is a project scoped to ship within the quarter.
3. **Monthly** — open `monthly-review.md`, answer the questions, edit your `objectives.md` if direction needs to shift.
4. **At year end** — the [yearly retrospective](../cadence/yearly.md) produces a year-in-review that updates `annual-themes.md` for next year. **This year's review becomes next year's command.**

## How AI uses this folder

When you ask Claude "should I take on X new project?" — point it at `strategy/objectives.md` and `strategy/quarterly-rocks.md`. It'll evaluate against your real direction, not a generic answer. When you do quarterly review, point it at the prior quarter's `quarterly-rocks.md` and have it ask the [five strategic questions from the cadence template](../cadence/quarterly.md).

The compounding: the AI gets better at strategic conversations the more this folder gets filled in. Empty strategy folder = AI guessing your priorities. Filled in = AI extending your priorities.

## What MaxShip does differently

Most methodologies teach OKRs. They teach you to *set* direction. They don't teach the **cadence** that lets you check whether direction is still right.

The MaxShip pattern: strategy lives in this folder, the **Strategic cadence** lives in [`cadence/quarterly.md`](../cadence/quarterly.md) + [`cadence/yearly.md`](../cadence/yearly.md). One sets the direction; the other validates whether reality is moving toward it. Both are required.

Read the full Strategy Mental System at [max-ship.com/log/strategic-planning](https://max-ship.com/log/strategic-planning).

---

Maintained as part of the open-source **Command Kit** at [github.com/shipwithmax/command](https://github.com/shipwithmax/command).
