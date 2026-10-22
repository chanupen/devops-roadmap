# Linux and systemd: interview questions

**What is the difference between a process and a thread?**
A process has its own address space; threads share the address space of their
process and are scheduled independently.

**What happens when you run a command in a shell?**
The shell parses the line, looks up the command in `PATH`, forks a child,
the child calls `exec` to replace itself with the program, and the shell waits
unless the command runs in the background.

**How do you find which process holds a deleted file?**
`lsof +L1` lists open files with a link count below one. Restarting or
signalling the holding process, or truncating via `/proc/<pid>/fd/<n>`, frees
the space.

**What does load average mean?**
The average number of tasks running or waiting to run (including
uninterruptible I/O wait on Linux) over 1, 5 and 15 minutes. Compare it with
the number of CPU cores.

**How would you debug a service that fails at boot?**
`systemctl status <unit>`, then `journalctl -b -u <unit>`, then check
dependencies with `systemctl list-dependencies <unit>` and ordering with
`systemd-analyze critical-chain`.
