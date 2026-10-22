# System design for SRE and platform roles

A repeatable structure for design rounds.

1. **Clarify.** Users, traffic, data size, latency and availability targets.
2. **Set SLOs.** Write them down before drawing anything.
3. **High-level design.** Components and data flow.
4. **Deep dive.** Pick the riskiest part: storage, caching, queues or failover.
5. **Failure modes.** What breaks first at 10x traffic? What if a region fails?
6. **Operations.** Deploys, observability, on-call, cost.
7. **Trade-offs.** Say what you chose not to do and why.

## Practice prompts

- Design a CI/CD platform for 200 microservices
- Design multi-region failover for a stateful service
- Design a metrics pipeline for 10 million active series
- Design a secrets management platform for many teams
