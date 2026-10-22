#!/usr/bin/env bash
# Creates a deliberately broken user service for the lab.
# Linux uses a systemd user unit; macOS uses a launchd user agent.
set -euo pipefail

LAB_DIR="${HOME}/.local/share/devops-roadmap/lab-01"
LOG_FILE="${LAB_DIR}/roadmap-web.log"

mkdir -p "${LAB_DIR}/site"
echo "roadmap lab ok" > "${LAB_DIR}/site/index.html"
: > "${LOG_FILE}"

# Two faults on both platforms: an interpreter path that does not exist on
# modern systems, and a working directory that was never created.
BAD_PYTHON="/usr/bin/python2"
BAD_DIR="${LAB_DIR}/www"

case "$(uname -s)" in
  Linux)
    command -v systemctl >/dev/null 2>&1 || { echo "This lab needs systemd." >&2; exit 1; }
    UNIT_DIR="${HOME}/.config/systemd/user"
    UNIT="roadmap-web.service"
    mkdir -p "${UNIT_DIR}"
    cat > "${UNIT_DIR}/${UNIT}" <<EOF
[Unit]
Description=Roadmap lab web server

[Service]
WorkingDirectory=${BAD_DIR}
ExecStart=${BAD_PYTHON} -m http.server 8099 --bind 127.0.0.1
Restart=no

[Install]
WantedBy=default.target
EOF
    systemctl --user daemon-reload
    systemctl --user start "${UNIT}" || true
    echo "Lab ready. The service is expected to be failing now."
    echo "Start with: systemctl --user status ${UNIT}"
    ;;
  Darwin)
    AGENT_DIR="${HOME}/Library/LaunchAgents"
    LABEL="local.roadmap-web"
    PLIST="${AGENT_DIR}/${LABEL}.plist"
    DOMAIN="gui/$(id -u)"
    mkdir -p "${AGENT_DIR}"
    launchctl bootout "${DOMAIN}/${LABEL}" 2>/dev/null || true
    cat > "${PLIST}" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>${LABEL}</string>
  <key>ProgramArguments</key>
  <array>
    <string>${BAD_PYTHON}</string>
    <string>-m</string>
    <string>http.server</string>
    <string>8099</string>
    <string>--bind</string>
    <string>127.0.0.1</string>
  </array>
  <key>WorkingDirectory</key>
  <string>${BAD_DIR}</string>
  <key>StandardOutPath</key>
  <string>${LOG_FILE}</string>
  <key>StandardErrorPath</key>
  <string>${LOG_FILE}</string>
  <key>RunAtLoad</key>
  <true/>
  <key>KeepAlive</key>
  <false/>
</dict>
</plist>
EOF
    launchctl bootstrap "${DOMAIN}" "${PLIST}" || true
    echo "Lab ready. The service is expected to be failing now."
    echo "Start with: launchctl print ${DOMAIN}/${LABEL}"
    ;;
  *)
    echo "Unsupported OS: $(uname -s). Use Linux (systemd) or macOS (launchd)." >&2
    exit 1
    ;;
esac
