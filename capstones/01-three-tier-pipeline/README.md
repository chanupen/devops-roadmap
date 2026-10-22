# Capstone 1: three-tier app pipeline

> Status: planned · Builds on: Phases 0 and 1

A small Python API backed by PostgreSQL, built and delivered the way a real team would ship it.

## What it delivers

- Python API with health and readiness endpoints, and unit tests
- PostgreSQL with migrations
- Multi-stage container image, scanned with Trivy
- GitHub Actions pipeline: lint, test, build, scan, push to GHCR
- Helm chart deployed to kind
- Build once, promote by tag across dev, stage and prod

## Deliverables

- [ ] Architecture diagram
- [ ] Design decisions with trade-offs
- [ ] Code and manifests in this folder
- [ ] A demo script that runs in under five minutes
