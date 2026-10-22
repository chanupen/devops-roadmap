# Artifact registries

> Status: planned

## Why it matters

Registries are where builds are stored, promoted and trusted.

## Core concepts

- GitHub Container Registry (GHCR)
- Harbor: projects, robot accounts, replication
- Tagging strategy: immutable tags, digests
- Retention and cleanup policies

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Run Harbor locally and push a signed image *(planned)*
2. Promote an image by retagging, not rebuilding *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Explain build once, promote many
- [ ] Pull an image by digest
- [ ] Set a retention policy
