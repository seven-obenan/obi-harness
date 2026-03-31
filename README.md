# Obi-Harness

A minimal, self-improving project operating system for AI agent teams.

## What this is

Obi-Harness is a directory template that turns any project folder into a structured workspace where AI agents can coordinate, learn from each other, and improve over time.

It was built from real production experience running multi-agent teams across website development, product builds, and business operations. The patterns in this repo were validated before they were documented.

## Why this exists

Modern AI agents (Claude Code, Cursor, Codex, Windsurf, and others) are powerful individually. But when you need multiple agents working on the same project, across sessions, across days, things break down:

- Agents repeat mistakes that previous agents already solved
- Important decisions live only in chat history and get lost
- One agent's work contradicts another's
- Nobody knows what "done" means
- The same failure happens three times before someone writes a rule about it

Obi-Harness solves this by making the project directory itself the shared operating context. Any agent spawned from the directory inherits the full project intelligence.

## The 3-layer model

### Layer 1: Project workspace (start here)

Six files and two folders. This is what you create on day one.

```
your-project/
  CLAUDE.md
  START_HERE.md
  AGENTS.md
  DOMAIN.md
  STATUS.md
  BENCHMARKS.md
  DECISIONS_LOG.md
  templates/
  reference/
```

Every file has one job. Agents read `START_HERE.md` first, `AGENTS.md` second, `STATUS.md` third. Everything else is pulled as needed.

### Layer 2: Meta layer (grows from use)

This layer appears when your project has enough agent sessions to learn from. It is not created on day one.

```
your-project/meta/
  execution-log/
  FAILURES.md
  HARNESS_CHANGELOG.md
  proposals/
```

Execution logs capture what each agent session did and whether it worked. A retrospective agent reads these logs and proposes improvements to the harness.

### Layer 3: Shared core (after 2+ projects)

Once you have two or more projects using Obi-Harness, patterns that work everywhere get promoted to a shared core.

```
project-os-core/
  PROTOCOLS.md
  FAILURE_PATTERNS.md
  templates/
  evaluator-roles/
  CHANGELOG.md
```

A pattern only enters the shared core after it has been validated in at least two projects. No speculative additions.

## Quick start

### Option 1: Copy the template

```bash
cp -r obi-harness/template/ ~/projects/my-new-project/
cd ~/projects/my-new-project/
```

Then edit each file for your specific project.

### Option 2: Use the init script

```bash
./scripts/init-project.sh ~/projects/my-new-project "My Project Name"
```

This copies the template and substitutes the project name in each file.

## Core principles

**Start small.** Six files on day one. Not twenty.

**Every file earns its place.** If a file is not being read by agents or updated by humans, remove it.

**Stable core, evolving edge.** Some files rarely change (`DOMAIN.md`, `BENCHMARKS.md`). Some change constantly (`STATUS.md`). That split is explicit.

**Agents choose what they need.** The mandatory reading order is 3 files. Everything else is indexed in `START_HERE.md` and pulled on demand.

**Failures are first-class.** The failure pattern registry is the highest-leverage file in the meta layer. One captured failure prevents dozens of future ones.

**The harness improves itself, but humans approve.** The meta layer uses an observe, propose, review, adopt cycle. Proposals are logged as files. Auto-editing core rules is not allowed.

**No jargon.** Files are named for what they contain. Nobody needs to understand "meta-harness theory" to use `FAILURES.md`.

## What this is not

- Not a project management tool
- Not a replacement for git, CI/CD, or deployment pipelines
- Not a framework that requires installation or dependencies
- Not opinionated about which AI model or coding tool you use

It is just a directory structure with well-designed files that make AI agents better at working together.

## Background

This system was inspired by:

- The Meta Harness paper (Stanford, MIT, 9 Seconds Crafted) on self-improving agent harnesses
- Andrej Karpathy's auto-research project on self-improving training loops
- Real production experience running multi-agent teams on website development, product builds, and business operations at Obenan

The core insight: the directory IS the harness. The harness should improve itself. But it should start simple.

## Documentation

- [Operating Model](docs/OPERATING_MODEL.md) - How the 3 layers work together
- [Retrospective Agent](docs/RETROSPECTIVE_AGENT.md) - How to run the self-improvement loop
- [Evaluator Roles](docs/EVALUATOR_ROLES.md) - Specialized agents that assess, not build

## Examples

- [Website project](examples/website-project/) - Based on a real multi-agent website build
- [Product project](examples/product-project/) - Product development workspace

## License

MIT
