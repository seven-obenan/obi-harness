# Domain

## What this project is

A public website rebuild for Acme, a B2B SaaS company. The site serves as the primary trust surface for prospective buyers.

## Who this is for

Business decision-makers evaluating Acme. The site must answer trust questions: who is this company, what does it do, why should I trust it.

## Non-negotiable rules

- Never use em dashes in customer-facing copy.
- Never position Acme as a "tool" or "platform" when stronger language exists.
- Customer is the hero. Acme is the guide.
- Reuse existing components before creating new ones.
- Every public route needs its own truthful metadata.
- Do not introduce isolated fonts, shadows, radii, or colors without system justification.

## Design system

- Typography: Helvetica Neue, light-weight display headlines
- Content frame: max-w-[1380px]
- Card radius: 24px to 32px family
- Section backgrounds: soft off-white (#f7f7f7, #f0f0f0) with white card islands
- Motion: restrained, state-revealing, not decorative

## Vocabulary

- "connect" not "sign up"
- "digital presence" not "SEO"
- "autonomous" not "AI-powered"
- "location" not "store"

## Repo structure

Production app: `whole-brain/services/frontend/apps/main`
Component families: `src/components/home-v2`, `about-v2`, `pricing-v2`, `common`
Team photos: `public/landing/team/`

## What is out of scope

- Dashboard UI changes
- Backend API changes
- Mobile app work
- CMS content management
