# Engineering Overlay

How to activate stricter discipline for software-heavy projects without turning Obi-Harness itself into a runtime or tool-specific framework.

## Purpose

Obi-Harness is the project shell.

Its core job is to provide durable memory, coordination, verification discipline, and self-improvement through project files.

Some projects need more than that.

If the project contains real software behavior, production code, APIs, workflows, or customer-facing logic, the harness should usually be paired with a stricter engineering overlay.

## When to activate it

Activate the engineering overlay when the project includes:

- application code
- APIs or backends
- user-facing software behavior
- production deployments
- non-trivial state or data changes
- regressions that need automated prevention

Usually activate it for:

- software products
- applications with real behavior
- websites with forms, flows, auth, payments, or critical interactions

Usually do not activate it fully for:

- strategy work
- research workspaces
- content-only projects
- simple marketing-copy projects without meaningful behavior

## The engineering loop

The default engineering loop is:

`spec -> test -> implement -> verify`

Meaning:

1. define or update the spec before changing behavior
2. define the testable success criteria
3. implement the smallest change that should satisfy them
4. verify independently before calling the work complete

The exact tooling can vary.
The discipline should not.

## Test hierarchy

Prefer a test pyramid, not a test wall.

### Unit tests

Use for:

- domain logic
- pure functions
- invariants
- narrow edge cases

These should be the fastest and most common tests.

### Integration tests

Use for:

- database boundaries
- HTTP boundaries
- queue or workflow boundaries
- multi-component behavior with real seams

These should prove that important parts work together.

### End-to-end tests

Use for:

- critical user journeys
- flows where browser behavior is part of the contract
- cases where the final visible outcome matters more than internal state alone

Do not make end-to-end tests your default proof for everything.
They are valuable, but slower and harder to debug.

## Adversarial verification

For non-trivial engineering work, use more than one perspective.

Recommended roles:

- **builder** — implements the change
- **evaluator** — checks the result against the spec and benchmarks
- **adversary / red team** — tries to break assumptions, find weak tests, or expose missing edge cases

This does not require a specific tool.
It requires deliberate separation of roles.

## CI expectations

If a project uses the engineering overlay, verification should not live only in local sessions.

At minimum:

- the relevant automated checks should be runnable from the repo
- the same checks should be runnable in CI
- important regressions should be caught repeatedly, not only once

The cadence depends on the project:

- on every PR
- on merge
- on a schedule

The principle is stable:

verification should be durable and repeatable.

## Hooks and guardrails

Hooks are optional.
They are implementation choices, not the heart of the harness.

Use hooks when they remove repeated friction or block repeated mistakes such as:

- changing behavior without updating specs
- editing production code without tests
- ending a session with broken verification

Do not add hooks just because the theory sounds attractive.
Add them when the project has earned them.

## Prompt and eval discipline

When AI is generating plans, code, tests, or artifacts repeatedly, treat prompts and agent instructions as testable assets.

Good overlay behavior includes:

- defining success criteria before generation
- checking outputs against deterministic criteria where possible
- refining prompts when the failures are prompt-induced
- recording durable prompt corrections in the project files

The goal is not perfect prompt theory.
The goal is fewer repeated mistakes.

## Boundary with Obi-Harness core

Obi-Harness core remains:

- project-scoped
- file-first
- minimal
- tool-agnostic

The engineering overlay adds stricter software discipline on top of that core.

It should not:

- redefine Obi-Harness as a runtime
- force one model vendor
- force one hook system
- force one CI provider
- turn every project into an engineering-heavy workflow

## Recommended bootstrap

For a software-heavy project:

1. start with the base Obi-Harness template
2. define the project's stable files
3. define verification benchmarks and evidence of done
4. activate the engineering overlay
5. only then add project-specific hooks, CI checks, evaluator roles, or stricter automation

That keeps the shell simple while giving engineering work a clear path to rigor.
