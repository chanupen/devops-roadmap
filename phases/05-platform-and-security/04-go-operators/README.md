# Go and Kubernetes operators

> Status: planned

## Why it matters

Operators encode operational knowledge as software.

## Core concepts

- Go basics: types, errors, goroutines, modules
- client-go and controller-runtime
- kubebuilder scaffolding
- Reconcile loops and status

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Build a small operator that manages a custom resource *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Write and test a small Go CLI
- [ ] Explain the reconcile loop
- [ ] Ship an operator with a CRD
