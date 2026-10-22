# Secrets management

> Status: planned

## Why it matters

Leaked secrets are one of the most common causes of real breaches.

## Core concepts

- HashiCorp Vault basics
- External Secrets Operator
- Sealed Secrets and SOPS
- Rotation and short-lived credentials

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Sync a Vault secret into Kubernetes with External Secrets *(planned)*
2. Rotate a database password with no downtime *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Explain the trade-offs between Vault, SOPS and cloud secret managers
- [ ] Wire External Secrets to an app
- [ ] Design a rotation process
