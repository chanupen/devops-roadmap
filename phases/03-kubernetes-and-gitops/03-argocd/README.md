# GitOps with Argo CD

> Status: planned

## Why it matters

GitOps makes Git the single source of truth for what runs in a cluster.

## Core concepts

- Applications and ApplicationSets
- App-of-apps pattern
- Sync waves, hooks, health checks
- Multi-cluster and multi-environment layouts
- Drift and self-heal

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Install Argo CD on kind *(planned)*
2. Bootstrap a cluster with app-of-apps *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Design a repo layout for three environments
- [ ] Explain how Argo CD detects and fixes drift
- [ ] Roll back by reverting a commit
