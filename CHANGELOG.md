# Changelog

## v1.0.0 - 2026-03-31

Initial release.

- 3-layer operating model: project workspace, meta layer, shared core
- Project template with 7 files and 2 folders
- Meta layer template with execution logs, failure patterns, harness changelog, and proposals
- Shared core template for cross-project intelligence
- Documentation: operating model, retrospective agent, evaluator roles
- Examples: website project, product project
- Init script for bootstrapping new projects
- MIT license

## v1.0.1 - 2026-03-31

Release polish.

- fixed README inconsistencies around day-one file count
- aligned shared-core naming in the README
- added a short layer-adoption guide
- added `CONTRIBUTING.md`
- expanded examples into honest miniature workspaces

## v1.0.2 - 2026-04-01

Claude Code optimization pass.

- strengthened `template/CLAUDE.md` with session continuity and writeback rules
- added `docs/CLAUDE_CODE_OPTIMIZATION.md`
- added practical worktree and merge-hotspot guidance to `docs/OPERATING_MODEL.md`
- clarified retrospective trigger conditions in `docs/RETROSPECTIVE_AGENT.md`
- added concrete failure examples to the meta and shared-core templates

## v1.0.3 - 2026-04-02

Positioning clarification.

- clarified the public framing of Obi-Harness as a filesystem-native project-files harness
- made the README more explicit that the project directory itself is the harness
- clarified in `docs/OPERATING_MODEL.md` that Obi-Harness is project-scoped, not a runtime or control plane

## v1.0.4 - 2026-04-03

Universal discipline pass.

- strengthened the public doctrine around loops, verification, phased work, and durable writeback
- clarified the distinction between Obi-Harness core and an optional engineering overlay
- added `docs/ENGINEERING_OVERLAY.md` for software-heavy projects
- strengthened the project template with clearer completion discipline and evidence-of-done expectations
- promoted universal protocols and failure patterns into the shared-core template

## v1.0.5 - 2026-04-07

Public explanation simplification.

- rewrote the README opening to explain Obi-Harness in plainer language with a clearer human / agent / file mental model
- added a visual explanation of how accepted truth moves through the directory and becomes reusable memory
- clarified in the README and operating model that execution logs are optional and secondary to durable files
- documented the optional control-tower / `META_HARNESS.md` pattern for advanced multi-lane workspaces without making it part of day-one setup
- added a frictionless README bootstrap prompt so new users can initialize a project by pasting one agent prompt and answering only the missing context
