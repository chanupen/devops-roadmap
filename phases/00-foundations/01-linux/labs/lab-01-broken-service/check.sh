#!/usr/bin/env bash
# Exit 0 when the service is active and serving the expected page.
set -euo pipefail

UNIT="roadmap-web.service"

if ! systemctl --user is-active --quiet "${UNIT}"; then
  echo "FAIL: ${UNIT} is not active"
  exit 1
fi

body="$(curl -fsS --max-time 3 http://127.0.0.1:8099/ || true)"
if [[ "${body}" != *"roadmap lab ok"* ]]; then
  echo "FAIL: service is running but not serving the expected page"
  exit 1
fi

echo "PASS: ${UNIT} is running and serving the page"
