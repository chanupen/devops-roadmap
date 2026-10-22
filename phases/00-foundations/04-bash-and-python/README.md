# Bash and Python scripting

> Status: planned

## Why it matters

Automation starts with small, safe scripts that other people can read.

## Core concepts

- Bash: `set -euo pipefail`, quoting, functions, traps
- Text tools: `grep`, `awk`, `sed`, `jq`, `yq`
- Python: `subprocess`, `pathlib`, `argparse`, `requests`
- Writing small CLIs with tests (`pytest`)
- Linting with `shellcheck` and `ruff`

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Write a log summariser in Bash, then rewrite it in Python *(planned)*
2. Write a health-check CLI with tests *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Write a Bash script that passes `shellcheck` with no warnings
- [ ] Parse JSON and YAML from the command line
- [ ] Ship a small Python CLI with unit tests
