# DevOps Roadmap

Learn DevOps step by step, by doing.
Each topic has short notes and a small hands-on lab you run on your own computer.

Free for everyone.

[![lint](https://github.com/chanupen/devops-roadmap/actions/workflows/lint.yml/badge.svg)](https://github.com/chanupen/devops-roadmap/actions/workflows/lint.yml)
[![links](https://github.com/chanupen/devops-roadmap/actions/workflows/links.yml/badge.svg)](https://github.com/chanupen/devops-roadmap/actions/workflows/links.yml)

## Start here

**Step 1. Get the code and install the tools** (Linux or macOS):

```bash
git clone https://github.com/chanupen/devops-roadmap.git
cd devops-roadmap
make bootstrap
```

**Step 2. Open the roadmap:** [ROADMAP.md](ROADMAP.md). Go from top to bottom.

**Step 3. For each topic, do these four things:**

1. **Read** the topic's notes (5 to 10 minutes).
2. **Start the lab.** Something is broken on purpose.
3. **Fix it.** Use the commands in the lab's README.
4. **Check** your fix. `PASS` means you are done.

```bash
make lab   M=00-foundations/01-linux L=lab-01-broken-service   # start
make check M=00-foundations/01-linux L=lab-01-broken-service   # check
make clean M=00-foundations/01-linux L=lab-01-broken-service   # clean up
```

That's it. Repeat for the next topic.

## How long it takes

About 4 to 5 months at 1 to 2 hours a day. Go at your own pace.
Skip the topics marked **Later** on your first pass; come back for them when you are ready.

## Stuck?

- Read the lab's **Hint** section.
- Look at the [cheatsheets](cheatsheets/).
- Run `make help` to see all commands.
- Lab won't start? See [docs/setup.md](docs/setup.md).

## What's in this repo

```text
ROADMAP.md     the learning path, start here
phases/        the topics, in order
capstones/     bigger projects that combine many topics
cheatsheets/   one-page command references
interview/     interview practice
tools/         setup scripts (you don't need to read these)
```

## Contributing

Fixes and ideas are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## Licence

[MIT](LICENSE). Use it, share it and change it freely.
