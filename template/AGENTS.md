# Agents

This file defines how agents should behave in this project.

## Before you start

1. Read `START_HERE.md`.
2. Read this file.
3. Read `STATUS.md` to understand what is currently in flight.

## Core behaviors

### Coordination

- Treat this directory as the shared memory layer. Do not rely on chat history for coordination.
- If multiple agents are working in parallel, write your findings, blockers, and decisions into the relevant files during your session, not after.
- If another agent's work affects yours, check `STATUS.md` before making assumptions.

### Writing back

- When you learn something durable, write it to the relevant file.
- When a workstream changes state, update `STATUS.md` in the same session.
- When you make a decision that future agents need to know, add it to `DECISIONS_LOG.md`.
- When you encounter a repeating failure, add it to `meta/FAILURES.md`.

### Quality

- Read code before modifying it. Understand existing patterns before introducing new ones.
- Reuse existing patterns before creating new ones.
- Do not add complexity beyond what the task requires.
- Verify your work before claiming it is complete.

### Completion discipline

- Do not make false completion claims.
- A builder's own statement is not sufficient proof that work is done.
- Use explicit evidence that matches the task: tests, browser checks, review findings, rendered output, or other concrete verification.
- If verification is partial, say so plainly and leave the workstream in the correct state.

### Phased execution

- Work in bounded phases when the task is non-trivial.
- After a meaningful phase, compact the state into the canonical files before context drifts.
- Prefer several verified loops over one long ambiguous session.

### Boundaries

- Do not take destructive actions (force push, delete branches, drop data) without explicit human approval.
- Do not auto-edit stable core files (`START_HERE.md`, `AGENTS.md`, `DOMAIN.md`, `BENCHMARKS.md`). Propose changes to `meta/proposals/` instead.
- Do not deploy to production without explicit human approval.
- Do not commit secrets, credentials, or sensitive data.

## Agent types

### Builder agents

Most agents are builders. They execute tasks: write code, fix bugs, create content, configure systems.

Builders should:
- Read the mandatory files before starting
- Pull additional context as needed from the index in `START_HERE.md`
- Define what success and verification look like before calling the task complete
- Update `STATUS.md` when done
- Log significant decisions

### Evaluator agents

Evaluator agents do not build. They assess.

Evaluators should:
- Read the mandatory files plus `BENCHMARKS.md`
- Compare current state against the benchmarks
- Report findings without making changes
- Flag drift, quality issues, or missing verification

For non-trivial work, do not let the same agent serve as both the only builder and the only evaluator if avoidable.

### Retrospective agents

Retrospective agents review prior work and propose harness improvements.

Retrospective agents should:
- Read the meta layer (`meta/execution-log/`, `meta/FAILURES.md`)
- Read the current harness files
- Write proposals to `meta/proposals/`
- Never directly edit stable core files

## Parallel agent rules

- Do not assume you are the only agent working on this project.
- Before modifying shared files, read their current state.
- Write durable findings into canonical files during the task, not in a handoff doc.
- If you discover a conflict with another agent's work, document it in `STATUS.md` and stop.
- If a task spans multiple phases or agents, keep the verification state explicit so the next agent does not mistake partial progress for completion.

## Expected output

Every agent session should leave behind some combination of:
- Work product (code, content, configuration)
- Updated `STATUS.md` if shared state changed
- Updated `DECISIONS_LOG.md` if decisions were made
- Updated `meta/FAILURES.md` if failures were encountered
- A note on what remains to be done
