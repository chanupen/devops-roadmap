# Lab 01: fix a broken service

## Goal

A user-level service should serve a page on `http://127.0.0.1:8099`. It fails
to start. Find out why and fix it.

On Linux the service is a systemd user unit, `roadmap-web.service`. On macOS,
which has no systemd, the same service is a launchd user agent,
`local.roadmap-web`. The faults are the same on both.

## Requirements

- Linux with systemd (Fedora, Ubuntu, Debian and similar), or macOS
- `python3` and `curl`
- No root access needed: the lab uses `systemctl --user` or a user LaunchAgent

## Steps

1. Set up the lab:

   ```bash
   ./setup.sh
   ```

   `setup.sh` leaves the service failing on purpose. That is your starting point.

2. Investigate.

   Linux:

   ```bash
   systemctl --user status roadmap-web.service
   journalctl --user -u roadmap-web.service -n 30 --no-pager
   systemctl --user cat roadmap-web.service
   ```

   macOS:

   ```bash
   launchctl print gui/$(id -u)/local.roadmap-web   # state, program, working directory, last exit code
   cat ~/Library/LaunchAgents/local.roadmap-web.plist
   cat ~/.local/share/devops-roadmap/lab-01/roadmap-web.log
   ```

3. Fix the service definition, then reload it.

   Linux: edit `~/.config/systemd/user/roadmap-web.service`, then:

   ```bash
   systemctl --user daemon-reload
   systemctl --user restart roadmap-web.service
   ```

   macOS: edit `~/Library/LaunchAgents/local.roadmap-web.plist`, then:

   ```bash
   launchctl bootout gui/$(id -u)/local.roadmap-web
   launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/local.roadmap-web.plist
   ```

4. Verify:

   ```bash
   ./check.sh
   ```

5. Clean up:

   ```bash
   ./cleanup.sh
   ```

## Hint

Read the first error carefully. There is more than one problem; fix them one at
a time. For every path in the service definition, check that it exists
(`ls -ld <dir>`, `command -v python3`).

## What you should be able to explain afterwards

- The difference between `systemctl status` and `journalctl`
- Why `daemon-reload` is needed after editing a unit file
- What `ExecStart`, `WorkingDirectory` and `Restart` do
- How the same ideas map to launchd: `ProgramArguments`, `WorkingDirectory`, `KeepAlive`
