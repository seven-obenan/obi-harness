# Operating Model

How the 3 layers of Obi-Harness work together inside a project workspace.

## The model

```
Layer 3: Shared Core          (cross-project intelligence)
         |
Layer 2: Meta Layer            (self-improvement loop)
         |
Layer 1: Project Workspace     (day-to-day agent work)
```

Each layer builds on the one below it. You always start with Layer 1. Layers 2 and 3 appear when the project needs them.

Obi-Harness is filesystem-native and project-scoped.
Its job is to improve how agents work through canonical project files inside one real project directory.
It is not a runtime or control plane outside the project workspace.

## Operating discipline

The harness is not only where files live. It is how agent work is disciplined.

The default loop is:

1. **Orient** — read the mandatory files and current state before acting
2. **Specify success** — make the expected outcome and verification criteria explicit
3. **Execute in bounded phases** — keep work scoped, resumable, and compactable
4. **Verify independently** — do not let the builder’s own claim be the only proof
5. **Write back** — update durable files so the next session does not rediscover the same truth
6. **Improve the harness** — capture failures and promote proven protocols over time

This discipline is universal across project types.

Software-heavy projects may add a stricter engineering overlay, but the core harness should always preserve:

- memory in files, not chat
- explicit verification before “done”
- separation between building and evaluating when the task is non-trivial
- phased work instead of one giant ambiguous session

## Layer 1: Project workspace

This is where work happens. Agents read the project files, execute tasks, and write their findings back.

Layer 1 is the harness in its most important form: the project's own files become the memory, coordination surface, and operating shell.

### File roles

| File | Role | Stability |
|---|---|---|
| `START_HERE.md` | Entry point and index | Stable |
| `AGENTS.md` | Behavioral rules | Stable |
| `DOMAIN.md` | Domain knowledge and constraints | Stable |
| `STATUS.md` | Live shared state | Evolving |
| `BENCHMARKS.md` | Success criteria | Stable |
| `DECISIONS_LOG.md` | Key decisions and reasoning | Evolving |
| `templates/` | Reusable agent prompts | Evolving |
| `reference/` | External material | Evolving |

### Mandatory reading order

Every agent reads 3 files before starting:

1. `START_HERE.md`
2. `AGENTS.md`
3. `STATUS.md`

Everything else is indexed in `START_HERE.md` and pulled on demand. This keeps token usage low and lets agents focus on what matters for their specific task.

### What “done” means at Layer 1

Layer 1 work is not done just because a builder says it is done.

At minimum, a completed session should leave behind:

- the work product
- explicit verification evidence appropriate to the task
- updated `STATUS.md` if shared state changed
- updated `DECISIONS_LOG.md` if the work changed durable direction

If verification is still pending, the status should say so plainly.

### The stable/evolving split

Stable files are infrastructure. They change only when the project's direction changes. If an agent needs to modify a stable file, it should log the change in `meta/HARNESS_CHANGELOG.md`.

Evolving files are operational. They change with every session. Agents should update them freely.

### Parallel builder isolation

When multiple builder agents are working in parallel, isolate mutable work.

Use separate branches or worktrees when:

- the same route family is being edited
- shared locale files are involved
- shared config or metadata files are involved
- one builder's in-progress edits would confuse another builder

Known merge hotspots usually include:

- shared locale JSON files
- shared configuration files
- global metadata files
- status or coordination files edited by many agents

Evaluator agents should avoid sharing a mutable builder workspace when possible. Review against the current source of truth instead.

## Layer 2: Meta layer

This layer appears when the project has accumulated enough agent sessions to learn from. Do not create it on day one.

### When to create it

Create the meta layer when any of these happen:
- The same failure occurs twice
- You want to run a retrospective on recent agent work
- A protocol change is needed and you want to track why
- Parallel-agent conflicts become common
- A release or major milestone just finished and you want to preserve lessons

### The self-improvement loop

```
Agent sessions produce execution logs
        |
        v
Retrospective agent reads logs + current harness
        |
        v
Retrospective agent writes proposals
        |
        v
Human reviews and adopts (or rejects)
        |
        v
Harness improves, logged in HARNESS_CHANGELOG.md
```

The key safety rule: **observe, propose, review, adopt.** The retrospective agent never directly edits stable core files. It writes proposals. A human decides what gets adopted.

### Execution logs

Execution logs are optional and secondary to curated durable files such as `STATUS.md`, `DECISIONS_LOG.md`,
and `FAILURES.md`.

After significant agent sessions, if the session taught something not already captured there, log:

```
meta/execution-log/YYYY-MM-DD-task-name/
  trace.md      - what the agent did (decisions, tool calls, files touched)
  outcome.md    - success / partial / failure + reasoning
  learnings.md  - what should change in the harness
```

Not every session needs a log. Log the ones that teach something.

### Failure patterns

`meta/FAILURES.md` is the highest-leverage file. Every failure captured here prevents future recurrences. Unlike execution logs which are per-session, failure patterns persist and accumulate.

## Layer 3: Shared core

This layer exists only after you have 2+ projects using Obi-Harness.

### Promotion rules

A pattern enters the shared core only when:
- It has been validated in at least 2 projects
- It reduces a measurable failure or friction
- It is general enough to apply across project types
- It is specific enough to be actionable

### What gets promoted

- Coordination protocols that work everywhere
- Failure patterns that repeat across projects
- Agent prompt templates that consistently produce good results
- Evaluator role definitions that prove useful

### What stays project-specific

- Domain knowledge
- Project-specific benchmarks
- Workstream status
- Decisions specific to one project

## How layers interact

**Layer 1 feeds Layer 2:** Agent sessions produce execution logs and surface failure patterns.

**Layer 2 feeds Layer 1:** Retrospective proposals improve the harness files that agents read.

**Layer 2 feeds Layer 3:** Patterns validated in one project become candidates for the shared core.

**Layer 3 feeds Layer 1:** When a new project is created, it inherits proven protocols from the shared core.

This creates a compounding loop: every project makes every future project better.

## Bootstrap sequence

For a new project, the recommended adoption order is:

1. Start with Layer 1 only
2. Define the stable project files for domain, behavior, and success criteria
3. Define verification benchmarks early, before agents start making completion claims
4. If the project is software-heavy, activate an engineering overlay
5. Add Layer 2 only when repeated failures or coordination complexity justify it

This keeps the harness small on day one while still leaving a clean path to stricter discipline when the project grows.
