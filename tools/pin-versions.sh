#!/usr/bin/env bash
# Replaces "latest" in tools/versions.env with the current exact version from mise.
set -euo pipefail

FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/versions.env"
tmp="$(mktemp)"

while IFS= read -r line; do
  if [[ "${line}" =~ ^([A-Z0-9_]+)_VERSION=latest$ ]]; then
    key="${BASH_REMATCH[1]}"
    tool="$(echo "${key}" | tr '[:upper:]' '[:lower:]')"
    version="$(mise latest "${tool}" 2>/dev/null || true)"
    if [[ -n "${version}" ]]; then
      echo "${key}_VERSION=${version}" >> "${tmp}"
      echo "pinned ${tool} -> ${version}"
      continue
    fi
    echo "could not resolve ${tool}, leaving as latest" >&2
  fi
  echo "${line}" >> "${tmp}"
done < "${FILE}"

mv "${tmp}" "${FILE}"
