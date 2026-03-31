# Benchmarks

## Quality benchmarks

- Every public route returns 200 and renders the expected hero content
- Visual consistency with the design system (typography, spacing, color, radius)
- Mobile and desktop both render correctly
- No lint errors introduced by agent work
- All customer-facing strings are translation-backed
- Metadata is route-specific, not inherited from homepage

## Verification benchmarks

- Changed routes render correctly in local preview before merge
- No layout regression in adjacent sections
- Production deploy succeeds after merge
- Live route serves expected title and body content post-deploy

## Agent performance benchmarks

- Tasks complete without requiring rework from stale state
- Agents stay within scope of the assigned task
- STATUS.md is updated after every session
- Design decisions reference DOMAIN.md constraints
- No brand drift (no new fonts, colors, or radii without justification)

## What "done" means

- Page change: code merged, deployed, verified on production route
- Asset change: old asset archived, new asset live, crop/presentation verified
- Copy change: translation keys updated across all active locales
- Component change: no regression in any page that uses the component
