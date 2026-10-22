# Containers with Podman and Docker

> Status: planned

## Why it matters

Containers are the unit of delivery for almost every modern platform.

## Core concepts

- Images, layers and registries
- Writing good `Containerfile`/`Dockerfile`s: multi-stage, small base, non-root
- Rootless Podman, `podman compose`
- Image scanning with Trivy
- Namespaces and cgroups under the hood

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Shrink an image from over 1 GB to under 100 MB *(planned)*
2. Run a container as non-root and fix what breaks *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Explain what a container is in terms of namespaces and cgroups
- [ ] Build a multi-stage image that passes a Trivy scan with no critical findings
- [ ] Debug a container that exits immediately
