# Roadmap

Seven steps. Do them in order. Each step builds on the one before.

```text
1. Basics  ──►  2. Build & ship  ──►  3. Infra as code  ──►  4. Kubernetes
                                                                  │
7. AI for ops  ◄──  6. Platform & security  ◄──  5. Monitoring  ◄──┘
```

Topics marked **Later** are useful but not needed on your first pass. Skip them and come back.

After steps 2, 5 and 7 there is a bigger project ([capstone](capstones/)) that puts it all together.

## Step 1 · Basics (2 weeks)

The skills everything else uses.

| Topic | What you learn |
| --- | --- |
| [Linux](phases/00-foundations/01-linux/) | Start, stop and fix services; read logs |
| [Networking](phases/00-foundations/02-networking/) | How computers find and talk to each other (DNS, ports, HTTPS) |
| [Git](phases/00-foundations/03-git/) | Save and share code changes; undo mistakes |
| [Bash and Python](phases/00-foundations/04-bash-and-python/) | Write small scripts to automate boring work |

## Step 2 · Build and ship (2 to 3 weeks)

Turn code into something you can run anywhere, and ship it automatically.

| Topic | What you learn |
| --- | --- |
| [Containers](phases/01-build-and-ship/01-containers/) | Package an app with everything it needs to run |
| [GitHub Actions](phases/01-build-and-ship/02-github-actions/) | Test and build your code automatically on every change |
| [Registries](phases/01-build-and-ship/04-registries/) | Store and share container images |
| [Release strategies](phases/01-build-and-ship/05-release-strategies/) | Ship new versions safely, and roll back |
| [Jenkins](phases/01-build-and-ship/03-jenkins/) **Later** | An older automation tool many companies still use |

➡ **Project:** [Capstone 1, app pipeline](capstones/01-three-tier-pipeline/)

## Step 3 · Infrastructure as code (3 weeks)

Create servers and cloud resources by writing code, not clicking buttons.

| Topic | What you learn |
| --- | --- |
| [Terraform](phases/02-iac-and-cloud/01-terraform/) | Create cloud resources from code |
| [AWS basics](phases/02-iac-and-cloud/03-aws-core/) | The main cloud building blocks: servers, storage, networks, users |
| [Secrets](phases/02-iac-and-cloud/04-secrets/) | Keep passwords and keys safe |
| [Ansible](phases/02-iac-and-cloud/02-ansible/) **Later** | Set up many servers the same way |

## Step 4 · Kubernetes (3 weeks)

Run many containers reliably on many machines.

| Topic | What you learn |
| --- | --- |
| [Kubernetes basics](phases/03-kubernetes-and-gitops/01-kubernetes-core/) | Run, fix and scale apps on a cluster |
| [Helm](phases/03-kubernetes-and-gitops/02-helm-and-kustomize/) | Package Kubernetes apps so they are easy to install |
| [Argo CD](phases/03-kubernetes-and-gitops/03-argocd/) | Deploy automatically from Git (GitOps) |
| [Autoscaling](phases/03-kubernetes-and-gitops/05-autoscaling/) **Later** | Add or remove copies of an app as traffic changes |
| [Flux](phases/03-kubernetes-and-gitops/04-flux/) **Later** | Another GitOps tool, similar to Argo CD |
| [Kyverno](phases/03-kubernetes-and-gitops/06-policy-kyverno/) **Later** | Block unsafe settings automatically |

## Step 5 · Monitoring and reliability (2 to 3 weeks)

Know when something breaks, and fix it fast.

| Topic | What you learn |
| --- | --- |
| [Prometheus and Grafana](phases/04-observability-and-sre/01-prometheus-grafana/) | Collect numbers (CPU, errors, speed) and draw dashboards |
| [Logs with Loki](phases/04-observability-and-sre/03-logging-loki/) | Collect and search logs from all your apps in one place |
| [Incidents](phases/04-observability-and-sre/05-incident-response/) | What to do when production breaks, and how to learn from it |
| [SLOs](phases/04-observability-and-sre/04-slos/) | Decide how reliable a service must be |
| [Tracing](phases/04-observability-and-sre/02-opentelemetry/) **Later** | Follow one request through many services |
| [Chaos testing](phases/04-observability-and-sre/06-chaos-testing/) **Later** | Break things on purpose to find weak spots |

➡ **Project:** [Capstone 2, GitOps platform](capstones/02-gitops-platform/)

## Step 6 · Platform and security (2 to 3 weeks)

Make the safe way the easy way for other developers.

| Topic | What you learn |
| --- | --- |
| [DevSecOps](phases/05-platform-and-security/01-devsecops/) | Find security problems in code and images before they ship |
| [Cost (FinOps)](phases/05-platform-and-security/03-finops/) **Later** | See and cut cloud spend |
| [Backstage](phases/05-platform-and-security/02-backstage/) **Later** | Build a portal where developers find services and docs |
| [Go operators](phases/05-platform-and-security/04-go-operators/) **Later** | Extend Kubernetes with your own code |

## Step 7 · AI for operations (2 weeks)

Use AI safely to help run systems.

| Topic | What you learn |
| --- | --- |
| [AI-assisted engineering](phases/06-ai-for-operations/01-ai-assisted-engineering/) | Use AI tools well, and check their output |
| [MCP servers](phases/06-ai-for-operations/02-mcp-servers/) | Give AI tools safe access to your systems |
| [Agents and guardrails](phases/06-ai-for-operations/03-agents-guardrails-evals/) **Later** | Build AI helpers that can't do damage |
| [Model serving](phases/06-ai-for-operations/04-model-serving/) **Later** | Run AI models as a service |
| [LLM monitoring](phases/06-ai-for-operations/05-llm-observability/) **Later** | Watch cost, speed and quality of AI apps |

➡ **Project:** [Capstone 3, AI on-call assistant](capstones/03-ai-oncall-assistant/)

## How to know you're ready to move on

Every topic ends with a short **Done when** list. If you can do everything on it, move to the next topic.
