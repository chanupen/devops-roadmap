# Terraform

> Status: planned

## Why it matters

Terraform is the most common way teams manage cloud infrastructure.

## Core concepts

- Providers, resources, data sources
- State, remote backends and locking
- Modules and versioning
- `plan` review, drift detection, `import`
- Testing with `terraform test`, `tflint`, `checkov`

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Write a reusable module and test it on LocalStack or real AWS *(planned)*
2. Recover from a corrupted or locked state *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Design a module with clear inputs and outputs
- [ ] Explain state locking and why it matters
- [ ] Import an existing resource without downtime
