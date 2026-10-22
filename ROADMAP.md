# Roadmap

Seven phases, 34 modules, about 16 to 20 weeks at 12 to 15 hours a week.
Time estimates are a first guess and will be adjusted as modules are completed.

```text
Phase 0  Foundations ─────────────┐
Phase 1  Build and ship ──────────┴──► Capstone 1: three-tier app pipeline
Phase 2  Infrastructure as code ──┐
Phase 3  Kubernetes and GitOps ───┤
Phase 4  Observability and SRE ───┴──► Capstone 2: GitOps platform
Phase 5  Platform and security ───┐
Phase 6  AI for operations ───────┴──► Capstone 3: AI on-call assistant
```

## Phase 0 · Foundations

The everyday skills every later phase depends on: reading a Linux box, following a packet, and automating small jobs. Estimated time: 2 weeks.

1. [Linux and systemd](phases/00-foundations/01-linux/)
2. [Networking for operators](phases/00-foundations/02-networking/)
3. [Git and GitHub flow](phases/00-foundations/03-git/)
4. [Bash and Python scripting](phases/00-foundations/04-bash-and-python/)

## Phase 1 · Build and ship

Turning source code into a tested, scanned, versioned artifact and moving it safely to production. Estimated time: 2 to 3 weeks.

1. [Containers with Podman and Docker](phases/01-build-and-ship/01-containers/)
2. [CI/CD with GitHub Actions](phases/01-build-and-ship/02-github-actions/)
3. [Jenkins pipelines](phases/01-build-and-ship/03-jenkins/)
4. [Artifact registries](phases/01-build-and-ship/04-registries/)
5. [Release strategies](phases/01-build-and-ship/05-release-strategies/)

## Phase 2 · Infrastructure as code and cloud

Describing infrastructure as reviewed, tested code instead of clicking in consoles. Estimated time: 3 weeks.

1. [Terraform](phases/02-iac-and-cloud/01-terraform/)
2. [Ansible](phases/02-iac-and-cloud/02-ansible/)
3. [AWS core services](phases/02-iac-and-cloud/03-aws-core/)
4. [Secrets management](phases/02-iac-and-cloud/04-secrets/)

## Phase 3 · Kubernetes and GitOps

Running workloads on Kubernetes and keeping clusters in the state Git says they should be in. Estimated time: 3 weeks.

1. [Kubernetes core (CKA scope)](phases/03-kubernetes-and-gitops/01-kubernetes-core/)
2. [Helm and Kustomize](phases/03-kubernetes-and-gitops/02-helm-and-kustomize/)
3. [GitOps with Argo CD](phases/03-kubernetes-and-gitops/03-argocd/)
4. [GitOps with Flux](phases/03-kubernetes-and-gitops/04-flux/)
5. [Autoscaling](phases/03-kubernetes-and-gitops/05-autoscaling/)
6. [Policy as code with Kyverno](phases/03-kubernetes-and-gitops/06-policy-kyverno/)

## Phase 4 · Observability and SRE

Knowing what your systems are doing, deciding how reliable they need to be, and handling incidents well. Estimated time: 2 to 3 weeks.

1. [Prometheus and Grafana](phases/04-observability-and-sre/01-prometheus-grafana/)
2. [OpenTelemetry and tracing](phases/04-observability-and-sre/02-opentelemetry/)
3. [Logging with Loki](phases/04-observability-and-sre/03-logging-loki/)
4. [SLOs and error budgets](phases/04-observability-and-sre/04-slos/)
5. [Incident response and postmortems](phases/04-observability-and-sre/05-incident-response/)
6. [Chaos testing](phases/04-observability-and-sre/06-chaos-testing/)

## Phase 5 · Platform and security

Building paved roads for developers and making the secure path the easy one. Estimated time: 2 to 3 weeks.

1. [DevSecOps and supply chain](phases/05-platform-and-security/01-devsecops/)
2. [Internal developer portal with Backstage](phases/05-platform-and-security/02-backstage/)
3. [FinOps and cost](phases/05-platform-and-security/03-finops/)
4. [Go and Kubernetes operators](phases/05-platform-and-security/04-go-operators/)

## Phase 6 · AI for operations

Using AI safely in daily engineering and in operations, and running AI workloads reliably. Estimated time: 2 weeks.

1. [AI-assisted engineering](phases/06-ai-for-operations/01-ai-assisted-engineering/)
2. [MCP servers](phases/06-ai-for-operations/02-mcp-servers/)
3. [Agents, guardrails and evals](phases/06-ai-for-operations/03-agents-guardrails-evals/)
4. [Model serving](phases/06-ai-for-operations/04-model-serving/)
5. [LLM observability](phases/06-ai-for-operations/05-llm-observability/)
