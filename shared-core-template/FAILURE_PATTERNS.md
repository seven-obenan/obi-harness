# Cross-Project Failure Patterns

These failure patterns have been observed across multiple projects. They are the most transferable knowledge in the system.

## Format

<!--
### [Pattern name]

Observed in: [project-1, project-2]

Pattern:
- [What goes wrong]

Root cause:
- [Why it happens]

Prevention:
- [What protocol or guardrail prevents it]

Status: [active / mitigated]
-->

## Promoted patterns

### False completion without real verification

Observed in: product-spec, website-rebuild

Pattern:
- a builder reported work as complete because the intended output looked plausible
- no independent verification was performed at the level the task actually required

Root cause:
- builder confidence was treated as evidence
- verification criteria were too vague or never written down

Prevention:
- define explicit evidence of done in the project benchmarks
- require independent verification for non-trivial work
- keep partial verification visible in status instead of quietly calling it done

Status: active

### Chat-only decisions disappear across sessions

Observed in: website-rebuild, repo-release

Pattern:
- important decisions, corrections, or blockers were left only in conversation history
- later agents repeated the same assumptions or re-opened the same issue

Root cause:
- chat was treated as memory instead of the project files

Prevention:
- durable decisions belong in a canonical file
- reusable mistakes belong in a failure registry
- active state belongs in the status layer

Status: mitigated

### Scope expansion by builder agents

Observed in: website-rebuild, product-spec

Pattern:
- a builder started with a bounded task and then expanded into adjacent work without explicit approval
- the final state mixed the intended fix with opportunistic extra changes

Root cause:
- success criteria were not bounded tightly enough
- builders optimized for “more improvement” instead of “exactly the assigned outcome”

Prevention:
- define the target outcome and verification before implementation
- use phased execution for non-trivial tasks
- require evaluators to check for scope drift as part of review

Status: active

### Repeated rediscovery of known corrections

Observed in: product-spec, repo-release

Pattern:
- later sessions rediscovered a correction that earlier sessions had already learned
- time was wasted re-diagnosing known issues

Root cause:
- durable lessons were left in chat or buried in transient handoffs
- failure patterns and decisions were not updated at the time of learning

Prevention:
- write durable corrections into canonical files in the same session
- treat repeated rediscovery as a harness failure, not just a task failure
- use retrospectives to promote recurring lessons into the shared core

Status: active
