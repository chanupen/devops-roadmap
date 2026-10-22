#!/usr/bin/env bash
# Removes everything the lab created.
set -euo pipefail

case "$(uname -s)" in
  Linux)
    UNIT="roadmap-web.service"
    systemctl --user stop "${UNIT}" 2>/dev/null || true
    rm -f "${HOME}/.config/systemd/user/${UNIT}"
    systemctl --user daemon-reload
    systemctl --user reset-failed "${UNIT}" 2>/dev/null || true
    ;;
  Darwin)
    LABEL="local.roadmap-web"
    launchctl bootout "gui/$(id -u)/${LABEL}" 2>/dev/null || true
    rm -f "${HOME}/Library/LaunchAgents/${LABEL}.plist"
    ;;
esac

rm -rf "${HOME}/.local/share/devops-roadmap/lab-01"
echo "Cleaned up."
