# DevSecOps and supply chain

> Status: planned

## Why it matters

Most attacks now target the build and delivery chain.

## Core concepts

- SAST with Semgrep
- Dependency and image scanning with Trivy
- SBOMs (Syft) and signing (cosign)
- SLSA levels
- Admission control for signed images

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Sign an image in CI and block unsigned images at admission *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Add scanning to a pipeline without slowing it down
- [ ] Explain SBOMs and signing
- [ ] Enforce signed images in a cluster
