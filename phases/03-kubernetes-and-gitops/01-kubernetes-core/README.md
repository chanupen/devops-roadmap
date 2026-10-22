# Kubernetes core (CKA scope)

> Status: planned

## Why it matters

Kubernetes is the default runtime for platform teams.

## Core concepts

- Architecture: control plane, kubelet, etcd
- Pods, Deployments, Services, Ingress
- ConfigMaps, Secrets, volumes, StatefulSets
- Scheduling: requests, limits, taints, affinity
- RBAC and NetworkPolicy
- Troubleshooting nodes, pods and networking
- etcd backup and cluster upgrades

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Fix five broken workloads (CrashLoopBackOff, ImagePullBackOff, Pending, OOMKilled, failing probes) *(planned)*
2. Back up and restore etcd *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Debug any pod state from `kubectl` alone
- [ ] Write RBAC for a team namespace
- [ ] Pass a CKA-style mock exam
