# Project Harness

Read `START_HERE.md` before doing any work.

This directory is a structured workspace managed by Obi-Harness.
Every agent working in this directory must follow the protocols defined here.

## Mandatory reading order

1. `START_HERE.md`
2. `AGENTS.md`
3. `STATUS.md`

Read these three files before every session. Everything else is indexed in `START_HERE.md` and should be pulled as needed based on the task.

## Key rules

- Files are memory. Chat is not. Write durable decisions to files.
- Do not let important decisions live only in chat history. Write them to `DECISIONS_LOG.md`.
- Update `STATUS.md` when your work changes the state of any active workstream.
- If you discover a repeating failure, add it to `meta/FAILURES.md` (create the meta layer if it does not exist yet).
- Resume an existing workstream session when possible instead of starting fresh.
- Before ending a task, write back the current state to the canonical files that changed.
- If parallel builders may touch overlapping write surfaces, use isolated branches or worktrees.
- Prefer reading the current state of files over recalling prior context. Files are the source of truth.
