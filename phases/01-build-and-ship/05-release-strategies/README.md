# Release strategies

> Status: planned

## Why it matters

How you release decides how bad a bad release gets.

## Core concepts

- Rolling, blue-green, canary
- Feature flags
- Rollback vs roll-forward
- Database migrations that do not block rollback

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Canary release with traffic split on kind *(planned)*
2. Practise a rollback under a simulated failure *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Choose a release strategy for a given service and defend it
- [ ] Run a canary and roll it back
- [ ] Plan a backward-compatible schema change
