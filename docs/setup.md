# Lab setup

All labs are designed to run on a single Linux machine. Fedora is the tested
target; Ubuntu and Debian also work.

## Recommended machine

| Resource | Minimum | Comfortable |
| --- | --- | --- |
| CPU | 4 cores | 8 cores or more |
| Memory | 16 GB | 32 GB |
| Disk | 50 GB free | 100 GB free, SSD |

## Install the toolchain

```bash
git clone https://github.com/chanupen/devops-roadmap.git
cd devops-roadmap
make bootstrap
make pin        # optional: lock "latest" to exact versions, then commit
```

## Working from another computer

You can keep the lab on the Linux machine and edit from a laptop:

1. Set up key-based SSH from the laptop to the lab machine.
2. Add a short host alias in `~/.ssh/config`, for example `Host lab`.
3. Open the repo with VS Code Remote SSH, or work in a terminal over SSH.

## Without a Linux machine

Open the repository in the dev container (`.devcontainer/`) with VS Code or
GitHub Codespaces. Labs that need systemd are marked and will not run there.

## Cloud labs

Every cloud lab can be run in two ways. Pick one per lab:

| Option | Cost | When to use it |
| --- | --- | --- |
| [LocalStack](https://www.localstack.cloud/) | Free, runs on your machine | Learning the tools, practising often, no AWS account |
| Real AWS | Small, pay as you go | Seeing real IAM, networking and service limits before an interview or job |

For real AWS:

1. Use a separate learning account, never a work account.
2. Set a budget alarm before the first lab.
3. Run the lab's cleanup step when you finish, every time.
