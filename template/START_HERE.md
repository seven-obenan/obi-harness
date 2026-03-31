# Start Here

This is the entry point for any agent working on this project.

## What this project is

<!-- Replace with a 2-3 sentence description of the project -->
[PROJECT_NAME] is ...

## Mandatory reading

Read these before every session:

1. `START_HERE.md` (this file)
2. `AGENTS.md` - how agents should behave
3. `STATUS.md` - what is happening right now

## Additional context (read when relevant)

- `DOMAIN.md` - domain knowledge, constraints, vocabulary, non-negotiables
- `BENCHMARKS.md` - what "good" means for this project
- `DECISIONS_LOG.md` - key decisions and their reasoning
- `templates/` - reusable agent prompts for common tasks
- `reference/` - external material that agents may need

Do not read everything upfront. Read what your task requires.

## Rules

- Every agent must update `STATUS.md` when their work changes shared state.
- Every significant decision must be logged in `DECISIONS_LOG.md`.
- If a meta layer exists (`meta/`), check `meta/FAILURES.md` before starting work that touches a known failure area.
- If your work produces a durable lesson, write it to the relevant file, not just to chat.

## File stability

These files rarely change (stable core):
- `START_HERE.md`
- `AGENTS.md`
- `DOMAIN.md`
- `BENCHMARKS.md`

These files change frequently (evolving edge):
- `STATUS.md`
- `DECISIONS_LOG.md`
- `templates/`
- `reference/`

If you need to change a stable core file, log the change and reasoning in `meta/HARNESS_CHANGELOG.md`.
