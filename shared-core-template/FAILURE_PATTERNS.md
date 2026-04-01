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

## Example promoted pattern

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
