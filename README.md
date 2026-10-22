# DevOps Roadmap

A hands-on path from Linux basics to platform engineering and SRE.
Seven phases, 34 modules and three capstone projects. Every module ends in a lab
you can run and verify on one Linux machine.

Free and open for every student and engineer who wants to learn.

[![lint](https://github.com/chanupen/devops-roadmap/actions/workflows/lint.yml/badge.svg)](https://github.com/chanupen/devops-roadmap/actions/workflows/lint.yml)
[![links](https://github.com/chanupen/devops-roadmap/actions/workflows/links.yml/badge.svg)](https://github.com/chanupen/devops-roadmap/actions/workflows/links.yml)

## Who it is for

- Engineers moving from operations or development into DevOps
- Experienced engineers filling gaps toward senior and staff platform or SRE roles

## How to use it

1. Set up your lab machine: [docs/setup.md](docs/setup.md)
2. Follow the phases in order: [ROADMAP.md](ROADMAP.md)
3. In each module, read the notes, run the labs, do the exercises, then tick the "Done when" list
4. Finish each group of phases with its [capstone](capstones/)

```bash
git clone https://github.com/chanupen/devops-roadmap.git
cd devops-roadmap
make bootstrap                     # install the toolchain
make lab M=00-foundations/01-linux L=lab-01-broken-service
make check M=00-foundations/01-linux L=lab-01-broken-service
make clean M=00-foundations/01-linux L=lab-01-broken-service
```

## Progress

| Phase | Modules | Est. time |
| --- | --- | --- |
| [Phase 0 · Foundations](phases/00-foundations/) | 4 | 2 weeks |
| [Phase 1 · Build and ship](phases/01-build-and-ship/) | 5 | 2 to 3 weeks |
| [Phase 2 · Infrastructure as code and cloud](phases/02-iac-and-cloud/) | 4 | 3 weeks |
| [Phase 3 · Kubernetes and GitOps](phases/03-kubernetes-and-gitops/) | 6 | 3 weeks |
| [Phase 4 · Observability and SRE](phases/04-observability-and-sre/) | 6 | 2 to 3 weeks |
| [Phase 5 · Platform and security](phases/05-platform-and-security/) | 4 | 2 to 3 weeks |
| [Phase 6 · AI for operations](phases/06-ai-for-operations/) | 5 | 2 weeks |

Status of each module is tracked in the project board and in each module's README.

## Principles

1. **Lab first.** No module is complete without a lab you can run and verify.
2. **Two ways to run cloud labs.** LocalStack for free practice on your machine, or real AWS when you want the real thing.
3. **Pinned versions.** All tool versions live in [`tools/versions.env`](tools/versions.env).
4. **Exact tool names.** `Argo CD`, `Terraform`, `OpenTelemetry`, not "a GitOps tool".
5. **Generic only.** No employer code, data or internal names.
6. **Plain writing.** Short notes, links to official docs for depth.

## Repository layout

```text
phases/        learning modules, in order
capstones/     projects that combine several phases
cheatsheets/   one-page references
interview/     system design, troubleshooting drills, STAR template
tools/         toolchain bootstrap, pinned versions, kind configs, CI helpers
docs/          lab setup and diagrams
```

## Contributing

Suggestions and fixes are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## Licence

Everything in this repository, code and notes, is under the [MIT licence](LICENSE). Use it, share it and adapt it freely.
