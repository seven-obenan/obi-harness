# Decisions Log

### Role visibility before speed

Date: 2026-03-31

Decision: Ship the new review request flow only after role-based access is verified.

Context: Previous dashboard regressions came from shipping the happy path before permission checks were complete.

Alternatives considered:

- release immediately and patch access later

Consequences:

- dashboard features now require access-control verification in the definition of done
