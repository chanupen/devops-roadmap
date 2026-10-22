# Phase 4 · Observability and SRE

Knowing what your systems are doing, deciding how reliable they need to be, and handling incidents well.

Estimated time: 2 to 3 weeks.

| Module | Labs |
| --- | --- |
| [Prometheus and Grafana](01-prometheus-grafana/) | Install kube-prometheus-stack on kind; Write the four golden signals dashboard for a sample app |
| [OpenTelemetry and tracing](02-opentelemetry/) | Instrument a two-service app and find a slow call |
| [Logging with Loki](03-logging-loki/) | Ship pod logs to Loki and query errors by trace ID |
| [SLOs and error budgets](04-slos/) | Define an availability and latency SLO for the sample app; Trigger a burn-rate alert with a staged failure |
| [Incident response and postmortems](05-incident-response/) | Run a tabletop incident from a staged failure; Write a blameless postmortem |
| [Chaos testing](06-chaos-testing/) | Kill pods and inject latency, then check SLOs held |
