#!/usr/bin/env bash
# Exit 0 when the service is running and serving the expected page.
set -euo pipefail

case "$(uname -s)" in
  Linux)
    NAME="roadmap-web.service"
    if ! systemctl --user is-active --quiet "${NAME}"; then
      echo "FAIL: ${NAME} is not active"
      exit 1
    fi
    ;;
  Darwin)
    NAME="local.roadmap-web"
    if ! launchctl print "gui/$(id -u)/${NAME}" 2>/dev/null | grep -q 'state = running'; then
      echo "FAIL: ${NAME} is not running"
      exit 1
    fi
    ;;
  *)
    echo "Unsupported OS: $(uname -s)" >&2
    exit 1
    ;;
esac

body="$(curl -fsS --max-time 3 http://127.0.0.1:8099/ || true)"
if [[ "${body}" != *"roadmap lab ok"* ]]; then
  echo "FAIL: service is running but not serving the expected page"
  exit 1
fi

echo "PASS: ${NAME} is running and serving the page"
