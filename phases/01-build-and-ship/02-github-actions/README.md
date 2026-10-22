# CI/CD with GitHub Actions

> Status: planned

## Why it matters

A pipeline is the fastest feedback loop a team has.

## Core concepts

- Workflows, jobs, steps, runners
- Caching, matrices, reusable workflows, composite actions
- Secrets and OIDC to cloud providers
- Environments and required approvals
- Pipeline security: pinning actions, least-privilege `permissions`

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Build, test and push an image on every PR *(planned)*
2. Reusable workflow shared by two repos *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Write a pipeline that builds, tests, scans and publishes an image
- [ ] Use OIDC instead of long-lived cloud keys
- [ ] Explain how to keep a pipeline secure
