# Evaluator Roles

Evaluator agents assess. They do not build.

This separation matters because builders are biased toward their own work. An independent evaluator catches things the builder missed.

## When to use evaluators

- Before releasing or deploying significant work
- When multiple agents worked in parallel and you need to verify alignment
- When a project has been running for a while and you suspect drift
- When preparing for a retrospective

## Available roles

### Retrospective agent

**Purpose:** Review prior sessions and propose harness improvements.

**Reads:** Execution logs, current harness files, failure patterns.

**Outputs:** Proposals in `meta/proposals/`.

**When to use:** After every 3-5 sessions or after notable failures.

See [Retrospective Agent](RETROSPECTIVE_AGENT.md) for full details.

### Drift detector

**Purpose:** Check whether recent work aligns with project constraints.

**Reads:** `DOMAIN.md`, `BENCHMARKS.md`, recent agent output.

**Outputs:** A drift report listing deviations from domain rules or benchmarks.

**When to use:** When parallel agents might have diverged, or after a long session.

### Quality auditor

**Purpose:** Review work product against quality benchmarks.

**Reads:** `BENCHMARKS.md`, the actual work product (code, content, configuration).

**Outputs:** A quality report with specific issues and recommendations.

**When to use:** Before releases, after major features, or before closing a workstream.

### Workspace hygiene auditor

**Purpose:** Check whether the project workspace is healthy.

**Reads:** All workspace files, git status, branch state, preview state.

**Outputs:** A hygiene report listing stale workstreams, outdated status, orphan branches, missing decisions.

**When to use:** Periodically on long-running projects, or before onboarding a new agent.

## How to add new evaluator roles

If you identify a recurring evaluation need that none of the existing roles cover:

1. Define the role with a clear purpose, inputs, and outputs
2. Test it on one project
3. If it proves useful, add it to this file
4. If it proves useful across 2+ projects, add it to the shared core
