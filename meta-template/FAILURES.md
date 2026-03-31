# Failure Patterns

This is the highest-leverage file in the meta layer.

Every time an agent fails in a way that could recur, capture it here. One captured failure prevents dozens of future ones.

## Format

<!--
### [Failure title]

First seen: YYYY-MM-DD
Frequency: [once / recurring / systemic]

What happened:
- ...

Why it happened:
- ...

What was misleading:
- [What signal or assumption led the agent astray]

Prevention rule:
- [What protocol, check, or guardrail should prevent recurrence]

Status: [open / mitigated / resolved]
-->

## Categories

Common failure categories to watch for:

- **False completion** - agent claims work is done but verification shows otherwise
- **Stale state** - agent acts on outdated information from files or cache
- **Scope drift** - agent expands beyond the assigned task
- **Coordination conflict** - two agents modify the same resource
- **Environment mismatch** - local behavior differs from production
- **Missing verification** - agent skips verification steps defined in benchmarks
