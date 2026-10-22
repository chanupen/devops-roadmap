# Autoscaling

> Status: planned

## Why it matters

Scaling well saves money and protects reliability.

## Core concepts

- HPA on CPU and custom metrics
- VPA
- Cluster Autoscaler vs Karpenter
- KEDA for event-driven scaling

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Scale a deployment on a custom metric *(planned)*
2. Simulate a spike and watch HPA react *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Explain how HPA computes replicas
- [ ] Choose between Cluster Autoscaler and Karpenter
- [ ] Set sensible requests and limits
