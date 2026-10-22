# Policy as code with Kyverno

> Status: planned

## Why it matters

Guardrails stop bad manifests before they reach production.

## Core concepts

- Validate, mutate and generate policies
- Policy reports
- Kyverno vs OPA Gatekeeper

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Block images without a tag digest *(planned)*
2. Require resource limits on every pod *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Write and test three useful policies
- [ ] Roll out a policy in audit mode first
- [ ] Explain Kyverno vs Gatekeeper
