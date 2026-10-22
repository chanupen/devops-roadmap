SHELL := /usr/bin/env bash
LAB_DIR = phases/$(M)/labs/$(L)

.PHONY: help bootstrap pin lint lab check clean cluster cluster-delete

help: ## Show available targets
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-16s %s\n", $$1, $$2}'

bootstrap: ## Install the pinned toolchain
	./tools/bootstrap.sh

pin: ## Resolve "latest" entries in tools/versions.env to exact versions
	./tools/pin-versions.sh

lint: ## Run local linters
	shellcheck $$(git ls-files '*.sh')
	yamllint -c .yamllint.yaml .
	npx --yes markdownlint-cli2 "**/*.md"

lab: ## Set up a lab: make lab M=<phase>/<module> L=<lab>
	@test -n "$(M)" -a -n "$(L)" || (echo "Usage: make lab M=<phase>/<module> L=<lab>"; exit 1)
	cd $(LAB_DIR) && ./setup.sh

check: ## Verify a lab
	@test -n "$(M)" -a -n "$(L)" || (echo "Usage: make check M=<phase>/<module> L=<lab>"; exit 1)
	cd $(LAB_DIR) && ./check.sh

clean: ## Clean up a lab
	@test -n "$(M)" -a -n "$(L)" || (echo "Usage: make clean M=<phase>/<module> L=<lab>"; exit 1)
	cd $(LAB_DIR) && ./cleanup.sh

cluster: ## Create the shared kind cluster
	kind create cluster --name roadmap --config tools/kind/cluster.yaml

cluster-delete: ## Delete the shared kind cluster
	kind delete cluster --name roadmap
