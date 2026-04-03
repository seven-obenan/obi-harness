# Shared Protocols

These protocols have been validated across multiple projects and promoted to the shared core.

A protocol is only added here after it has proven useful in at least two separate project workspaces.

Current protocols were promoted from recurring use across `website-rebuild`, `product-spec`, and `repo-release`
workspaces.

## Promotion criteria

- Validated in 2+ projects
- Reduced a measurable failure or friction
- General enough to apply across project types
- Specific enough to be actionable

## Protocols

### Files Are Memory

- Durable decisions belong in canonical files, not chat history
- Shared state belongs in the status layer
- Reusable corrections belong in failure or decision logs

### Verify Before Done

- Builder claims are not enough on their own
- Completion requires explicit verification evidence appropriate to the task
- If verification is incomplete, status must say so plainly

### Builder/Evaluator Separation

- Builders implement
- Evaluators assess
- For non-trivial work, avoid relying on one agent to both build and self-certify

### Phase Then Compact

- Break larger work into bounded phases
- After each meaningful phase, compact durable truth into the project files
- Do not let long sessions carry critical state only in context windows

### Write Back Durable Corrections

- If a correction should survive the session, write it back
- Repeated mistakes should become failure patterns or protocol changes
- The harness improves through durable file updates, not through memory alone
