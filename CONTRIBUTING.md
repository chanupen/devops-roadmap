# Contributing

Thanks for helping improve the roadmap.

## Ground rules

- Keep everything generic: no employer code, data, internal hostnames or names.
- Use exact tool names and link to official documentation.
- Every new lab needs `README.md`, `setup.sh`, `check.sh` and `cleanup.sh`.
- `check.sh` must exit 0 on success and print a clear PASS or FAIL line.
- If a lab cannot run on a hosted GitHub runner, add a `.ci-skip` file with the reason.
- Cloud labs give both a LocalStack path and a real AWS path, with a cleanup step for each.
- Shell scripts start with `set -euo pipefail` and pass `shellcheck`.

## Module layout

```text
phases/<phase>/<module>/
├── README.md               # why, concepts, real-team notes, labs, done when
├── labs/lab-NN-<name>/     # README.md, setup.sh, check.sh, cleanup.sh
├── exercises.md
├── interview-questions.md
└── resources.md
```

## Before opening a pull request

```bash
make lint
```

## Commit messages

Use short, imperative messages, for example `linux: add disk-full lab`.
