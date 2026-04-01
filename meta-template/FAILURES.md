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

## Example entries

### False completion after response-only verification

First seen: 2026-03-31
Frequency: recurring

What happened:
- an agent claimed a route was fully shipped because the expected strings appeared in the raw response
- the visible browser-level behavior had not actually been checked

Why it happened:
- raw HTML and response inspection were treated as full release verification

What was misleading:
- correct strings in the response payload created false confidence

Prevention rule:
- when layout, hydration, modal behavior, or CTAs matter, verify in a real browser before calling the work complete

Status: mitigated

### Shared file overwrite during parallel work

First seen: 2026-03-31
Frequency: recurring

What happened:
- two parallel workstreams edited the same shared file family and one namespace or change was lost

Why it happened:
- builder agents worked in parallel without enough isolation or namespace-level merge discipline

What was misleading:
- each branch looked correct in isolation

Prevention rule:
- isolate builders with separate worktrees when they may touch merge hotspots, and merge shared files at the smallest meaningful unit

Status: mitigated
