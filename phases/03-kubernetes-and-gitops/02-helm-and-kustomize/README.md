# Helm and Kustomize

> Status: planned

## Why it matters

Packaging decides how easy it is to run one app in many environments.

## Core concepts

- Helm charts, values, templates, hooks
- Library charts
- Kustomize bases and overlays
- When to use which

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Write a chart for a small web app with per-environment values *(planned)*
2. Convert the same app to Kustomize overlays *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Write a chart that passes `helm lint` and `kubeconform`
- [ ] Explain Helm vs Kustomize trade-offs
- [ ] Debug a failed Helm upgrade
