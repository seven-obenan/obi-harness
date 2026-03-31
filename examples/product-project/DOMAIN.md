# Domain

## What this project is

Customer dashboard for Acme. Multi-location businesses use it to manage reviews, listings, content, and analytics across all their locations.

## Who this is for

Business operators and marketing teams managing 1 to 500+ locations.

## Non-negotiable rules

- Never break existing API contracts without a migration path.
- Every user-facing action must have a loading state and an error state.
- Location data is the source of truth. Do not cache stale location state.
- All text must use translation keys. No hardcoded strings.
- Role-based access must be enforced on both frontend and backend.

## Technical constraints

- Frontend: Next.js with Apollo GraphQL client
- Backend: NestJS with PostgreSQL
- Auth: JWT with role-based permissions
- Deployment: CI/CD through GitHub Actions
- Tests: Vitest for unit, Playwright for E2E

## User roles

- Owner: full access to all locations and billing
- Manager: access to assigned locations, no billing
- Viewer: read-only access

## What is out of scope

- Public website changes
- Mobile app
- Third-party integrations beyond the defined API surface
- Infrastructure and DevOps changes
