# Jenkins pipelines

> Status: planned

## Why it matters

Many large organisations still run Jenkins; you will meet it.

## Core concepts

- Declarative vs scripted pipelines
- Shared libraries
- Agents on Kubernetes
- Job DSL and Configuration as Code (JCasC)
- Credentials handling

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Run Jenkins in a container with JCasC *(planned)*
2. Write a shared library step used by two pipelines *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Write a declarative `Jenkinsfile` with stages, parallel steps and post actions
- [ ] Explain when a shared library is worth it
- [ ] Configure Jenkins fully from code
