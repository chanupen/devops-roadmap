# Phase 1 · Build and ship

Turning source code into a tested, scanned, versioned artifact and moving it safely to production.

Estimated time: 2 to 3 weeks.

| Module | Labs |
| --- | --- |
| [Containers with Podman and Docker](01-containers/) | Shrink an image from over 1 GB to under 100 MB; Run a container as non-root and fix what breaks |
| [CI/CD with GitHub Actions](02-github-actions/) | Build, test and push an image on every PR; Reusable workflow shared by two repos |
| [Jenkins pipelines](03-jenkins/) | Run Jenkins in a container with JCasC; Write a shared library step used by two pipelines |
| [Artifact registries](04-registries/) | Run Harbor locally and push a signed image; Promote an image by retagging, not rebuilding |
| [Release strategies](05-release-strategies/) | Canary release with traffic split on kind; Practise a rollback under a simulated failure |
