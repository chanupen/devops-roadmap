#!/usr/bin/env bash
# Creates a deliberately broken user service for the lab.
set -euo pipefail

LAB_DIR="${HOME}/.local/share/devops-roadmap/lab-01"
UNIT_DIR="${HOME}/.config/systemd/user"
UNIT="roadmap-web.service"

mkdir -p "${LAB_DIR}/site" "${UNIT_DIR}"
echo "roadmap lab ok" > "${LAB_DIR}/site/index.html"

# Two faults: a wrong interpreter path and a wrong working directory.
cat > "${UNIT_DIR}/${UNIT}" <<EOF
[Unit]
Description=Roadmap lab web server

[Service]
WorkingDirectory=${LAB_DIR}/www
ExecStart=/usr/bin/python -m http.server 8099 --bind 127.0.0.1
Restart=no

[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload
systemctl --user start "${UNIT}" || true

echo "Lab ready. The service is expected to be failing now."
echo "Start with: systemctl --user status ${UNIT}"
