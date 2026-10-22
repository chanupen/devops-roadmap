# Phase 3 · Kubernetes and GitOps

Running workloads on Kubernetes and keeping clusters in the state Git says they should be in.

Estimated time: 3 weeks.

| Module | Labs |
| --- | --- |
| [Kubernetes core (CKA scope)](01-kubernetes-core/) | Fix five broken workloads (CrashLoopBackOff, ImagePullBackOff, Pending, OOMKilled, failing probes); Back up and restore etcd |
| [Helm and Kustomize](02-helm-and-kustomize/) | Write a chart for a small web app with per-environment values; Convert the same app to Kustomize overlays |
| [GitOps with Argo CD](03-argocd/) | Install Argo CD on kind; Bootstrap a cluster with app-of-apps |
| [GitOps with Flux](04-flux/) | Bootstrap Flux and deploy the same app as the Argo CD module |
| [Autoscaling](05-autoscaling/) | Scale a deployment on a custom metric; Simulate a spike and watch HPA react |
| [Policy as code with Kyverno](06-policy-kyverno/) | Block images without a tag digest; Require resource limits on every pod |
