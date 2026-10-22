# Prometheus and Grafana

> Status: planned

## Why it matters

Metrics are the first signal in most incidents.

## Core concepts

- Prometheus data model and PromQL
- Exporters and ServiceMonitors
- Recording and alerting rules
- Alertmanager routing
- Grafana dashboards as code

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Install kube-prometheus-stack on kind *(planned)*
2. Write the four golden signals dashboard for a sample app *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Write PromQL for rate, error ratio and p99 latency
- [ ] Route alerts by severity
- [ ] Keep dashboards in Git
