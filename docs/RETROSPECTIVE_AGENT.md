# Retrospective Agent

How to run the self-improvement loop.

## What it does

The retrospective agent reads prior execution logs and the current harness files, identifies patterns (what works, what fails, what is missing), and proposes concrete improvements.

It does not build. It does not fix code. It improves the operating system itself.

## When to run it

- After every 3-5 significant agent sessions
- After a notable failure
- After a successful multi-agent coordination effort
- Before starting a new phase of the project

## How to run it

Spawn an agent with the following prompt (adapt to your tool):

```
You are a retrospective agent for this project.

Your job is to review recent agent work and propose improvements to the project harness.

Read these files first:
1. START_HERE.md
2. AGENTS.md
3. BENCHMARKS.md
4. meta/FAILURES.md
5. meta/HARNESS_CHANGELOG.md

Then read the recent execution logs in meta/execution-log/.

Based on what you find, answer these questions:
1. Which agent sessions succeeded and why?
2. Which agent sessions failed or struggled, and why?
3. Are there failure patterns that should be added to FAILURES.md?
4. Are there protocols in AGENTS.md that are being ignored?
5. Are there missing protocols that would have prevented recent problems?
6. Are there benchmarks in BENCHMARKS.md that are unclear or missing?
7. Should any file in the stable core be updated?

Write your proposals to meta/proposals/ as individual markdown files.
Each proposal should include:
- What to change
- Why (linked to specific execution log evidence)
- Expected effect on future agent sessions

Do not directly edit any stable core files.
```

## What to do with proposals

Review each proposal in `meta/proposals/`.

For each one:
- **Adopt:** Apply the change to the relevant file. Log it in `meta/HARNESS_CHANGELOG.md`. Move the proposal to a dated `adopted/` subfolder or delete it.
- **Reject:** Add a note explaining why and delete the proposal.
- **Defer:** Leave it in `proposals/` for future consideration.

## Evaluator variants

As a project matures, you may want specialized evaluators instead of (or in addition to) the general retrospective agent:

### Drift detector

Checks whether recent agent work aligns with `DOMAIN.md` and `BENCHMARKS.md`. Flags deviations. Useful when multiple agents are working in parallel and coordination risk is high.

### Quality auditor

Reviews the work product itself (code quality, design consistency, test coverage) against the benchmarks. Useful before releases.

### Workspace hygiene auditor

Checks whether files are up to date, whether `STATUS.md` reflects reality, whether there are orphan branches or stale workstreams. Useful for long-running projects.

Start with just the retrospective agent. Add specialized evaluators when the project's complexity demands them.
