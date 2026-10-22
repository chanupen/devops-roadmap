#!/usr/bin/env bash
# Runs setup.sh and check.sh for every lab touched since the base ref.
# Labs with a .ci-skip file are skipped. Usage: run-changed-labs.sh <base-ref>
set -euo pipefail

BASE="${1:-origin/main}"
mapfile -t labs < <(git diff --name-only "${BASE}"...HEAD \
  | grep -E '^phases/[^/]+/[^/]+/labs/[^/]+/' \
  | cut -d/ -f1-5 | sort -u)

if [[ ${#labs[@]} -eq 0 ]]; then
  echo "No labs changed."
  exit 0
fi

failed=0
for lab in "${labs[@]}"; do
  [[ -d "${lab}" ]] || continue
  if [[ -f "${lab}/.ci-skip" ]]; then
    echo "SKIP ${lab}: $(cat "${lab}/.ci-skip")"
    continue
  fi
  echo "::group::${lab}"
  if (cd "${lab}" && ./setup.sh && ./check.sh); then
    echo "PASS ${lab}"
  else
    echo "FAIL ${lab}"
    failed=1
  fi
  (cd "${lab}" && ./cleanup.sh) || true
  echo "::endgroup::"
done

exit "${failed}"
