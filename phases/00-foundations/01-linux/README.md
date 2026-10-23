# Linux

> Status: in progress

## In one sentence

Almost every server, container and cloud machine runs Linux, so knowing how to
look around a Linux machine and fix it is the first DevOps skill.

## Words to know

- **Process.** A program that is running. Each one has a number (PID).
- **Service.** A process that runs in the background, like a web server.
- **systemd.** The part of Linux that starts and stops services.
- **Log.** The messages a program writes about what it is doing. Errors show up here.

## The 4 commands to learn first

```bash
systemctl --user status app.service      # Is it running? Did it crash?
journalctl --user -u app.service -n 30   # Show the last 30 log lines
systemctl --user restart app.service     # Restart it
df -h                                    # How much disk space is left?
```

How they fit together:

```text
systemctl start  ──►  systemd reads the service file  ──►  runs the program
                                                              │
journalctl       ◄──────────  saves everything the program prints
```

## Golden rule

**Read the logs before you restart.** A restart can hide the real problem.

## Lab

| Lab | What you do |
| --- | --- |
| [lab-01-broken-service](labs/lab-01-broken-service/) | A web server won't start. Read its logs and fix it. |
| lab-02-disk-full *(coming soon)* | The disk is full. Find out what is filling it. |

## Done when

- [ ] You can check if a service is running and read its logs
- [ ] You fixed lab-01 and `make check` says `PASS`
- [ ] You can find which program is using the most CPU and memory (`top`)

## Want more?

- [Exercises](exercises.md): extra practice questions
- [Interview questions](interview-questions.md)
- [Resources](resources.md): links to go deeper
