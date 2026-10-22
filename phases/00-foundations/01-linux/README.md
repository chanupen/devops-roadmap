# Linux and systemd

> Status: in progress (worked example for the module template)

## Why it matters

Most production incidents end on a Linux host. Containers, Kubernetes nodes and
CI runners are all Linux underneath, so reading a host quickly and calmly is the
base skill for everything else in this roadmap.

## Core concepts

- **Processes and signals.** Every process has a PID, a parent, an owner and a
  state. `SIGTERM` asks a process to stop; `SIGKILL` forces it.
- **systemd.** Services are described by unit files. `systemctl` starts, stops
  and inspects them; `journalctl` reads their logs.
- **Filesystems.** Space and inodes can both run out. A deleted file stays on
  disk while a process still holds it open.
- **Permissions.** Owner, group and other, plus `sudo` for controlled escalation.
- **Performance basics.** `top`, `vmstat`, `iostat`, `ss` and `lsof` answer
  most "why is this host slow" questions.

```text
systemctl --user start app.service
        │
        ▼
 systemd reads unit file ──► starts ExecStart ──► process runs
        │                                            │
        ▼                                            ▼
 journalctl --user -u app  ◄─────────── stdout / stderr captured
```

## In a real team

- Check the logs before restarting anything; a restart can hide the cause.
- Prefer `systemctl status` plus `journalctl -u <unit> -n 50` as the first two commands.
- A host that "has free space" can still fail writes if inodes are exhausted.
- Write down what you ran during an incident; it becomes the postmortem timeline.

## Labs

| Lab | Goal | Runs in CI |
| --- | --- | --- |
| [lab-01-broken-service](labs/lab-01-broken-service/) | Fix a systemd service that fails to start | No (needs a user systemd session) |
| lab-02-disk-full *(planned)* | Find what is filling the disk, including deleted-but-open files | Planned |

## Done when

- [ ] Explain what happens from power-on to a login prompt
- [ ] Debug a failing service using only `systemctl` and `journalctl`
- [ ] Find the top CPU, memory and I/O consumers on a host in under five minutes
