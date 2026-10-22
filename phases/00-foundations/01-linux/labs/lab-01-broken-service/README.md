# Lab 01: fix a broken systemd service

## Goal

A user-level service called `roadmap-web.service` should serve a page on
`http://127.0.0.1:8099`. It fails to start. Find out why from its logs and fix it.

## Requirements

- A Linux machine with systemd (Fedora, Ubuntu, Debian and similar)
- `python3` and `curl`
- No root access needed: the lab uses `systemctl --user`

## Steps

1. Set up the lab:

   ```bash
   ./setup.sh
   ```

2. Investigate. Useful commands:

   ```bash
   systemctl --user status roadmap-web.service
   journalctl --user -u roadmap-web.service -n 30 --no-pager
   systemctl --user cat roadmap-web.service
   ```

3. Fix the unit file at `~/.config/systemd/user/roadmap-web.service`, then:

   ```bash
   systemctl --user daemon-reload
   systemctl --user restart roadmap-web.service
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

Read the first error line in the journal carefully. There is more than one
problem; fix them one at a time.

## What you should be able to explain afterwards

- The difference between `systemctl status` and `journalctl`
- Why `daemon-reload` is needed after editing a unit file
- What `ExecStart`, `WorkingDirectory` and `Restart` do
