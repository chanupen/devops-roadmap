# Capstone 2: GitOps platform

> Status: planned · Builds on: Phases 2 to 4

A small platform where everything in the cluster is declared in Git and observed with SLOs.

## What it delivers

- Cluster created with Terraform (kind locally, EKS optional)
- Argo CD app-of-apps bootstrap
- Kyverno policies for images, limits and labels
- External Secrets with Vault
- kube-prometheus-stack, Loki and OpenTelemetry Collector
- SLOs with multi-window burn-rate alerts and a staged incident

## Deliverables

- [ ] Architecture diagram
- [ ] Design decisions with trade-offs
- [ ] Code and manifests in this folder
- [ ] A demo script that runs in under five minutes
