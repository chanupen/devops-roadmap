#!/usr/bin/env bash
# Removes everything the lab created.
set -euo pipefail

UNIT="roadmap-web.service"
systemctl --user stop "${UNIT}" 2>/dev/null || true
rm -f "${HOME}/.config/systemd/user/${UNIT}"
systemctl --user daemon-reload
rm -rf "${HOME}/.local/share/devops-roadmap/lab-01"
echo "Cleaned up."
