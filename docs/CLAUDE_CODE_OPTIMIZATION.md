# Claude Code Optimization

How to get better results from Claude Code inside Obi-Harness without adding unnecessary complexity.

## 1. Treat `CLAUDE.md` as the invariant shell

`CLAUDE.md` should stay short and stable.

Its job is to reinforce the rules that should apply on every turn:

- which files are mandatory
- that files are memory, not chat
- that sessions should be resumed when possible
- that canonical docs must be updated before a task is closed

Do not turn `CLAUDE.md` into a long handbook.
If it gets too long, agents skim it.

## 2. Resume sessions when the workstream is continuous

Do not start fresh by reflex.

Resume the same session when:

- the workstream is still the same
- the same files or route family are involved
- you are continuing a review, release, or verification loop

Start a new session when:

- the task is meaningfully unrelated
- the old session is polluted with wrong assumptions
- you are intentionally forking a new workstream

## 3. Use worktrees for parallel builders

If two builder agents may write to overlapping areas, isolate them.

Use separate worktrees or clean branches when:

- shared locale files are involved
- shared config or metadata files are involved
- multiple builders are editing the same route family

Avoid sharing one mutable checkout across multiple builder agents.

Evaluator agents should prefer read-only review against the current source of truth instead of sharing a live mutable builder workspace.

## 4. Separate builder and evaluator roles

Builder agents implement.
Evaluator agents verify.
Retrospective agents improve the harness.

Do not collapse all three roles into one session if you can avoid it.

This reduces:

- false completion claims
- verification gaps
- drift between implementation and review

## 5. Compact proactively

Do not wait for context to decay at the wrong moment.

Compact after:

- a major milestone
- a blocker is fully understood
- a release is verified
- a workstream changes direction

Before compacting, preserve the important state in files:

- current goal
- files touched
- blocker
- correction
- next step

Usually this means updating:

- `STATUS.md`
- `DECISIONS_LOG.md`
- `meta/FAILURES.md` if the lesson is reusable

## 6. Keep hooks minimal

Hooks can help, but they are easy to overbuild.

Only add hooks if they remove repeated friction or prevent repeated mistakes.

The most defensible hook categories are:

- session start reminders
- pre-tool safety checks
- session end writeback reminders

If a rule can live cleanly in `CLAUDE.md` or `AGENTS.md`, prefer that first.

## 7. Protect the stable core

These files should change rarely:

- `START_HERE.md`
- `AGENTS.md`
- `DOMAIN.md`
- `BENCHMARKS.md`
- `CLAUDE.md`

If one of them needs to change, treat it as a harness change, not a casual edit.

Log the reason in:

- `meta/HARNESS_CHANGELOG.md`

## 8. Common failure prevention rules

- Do not treat raw response checks as full release verification when UI behavior matters.
- Do not rely on chat history as the system of record.
- Do not let multiple builders edit known merge hotspots casually.
- Do not call work done until the canonical files reflect reality.

## Bottom line

Claude Code gets stronger when the harness around it is disciplined.

The biggest gains usually come from:

- better persistent files
- better session continuity
- better isolation
- better verification

Not from making the prompt longer.
