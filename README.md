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

**Step 2. Use one command for everything: `./roadmap`**

```bash
./roadmap          # see your progress and what to do next
./roadmap start    # start your next lab (something is broken on purpose)
./roadmap hint     # read what to do
./roadmap check    # check your fix; PASS means done
./roadmap stop     # clean up, then run ./roadmap again
```

You don't need to remember lab names or folders. `./roadmap` always tells you
the next command to run, and it remembers what you have finished.

```text
DevOps Roadmap

Step 1 · Basics (2 weeks)
  ✔ Linux                       1. lab-01-broken-service        done
  · Networking                     lab coming soon
  ...

Progress: 1 of 1 labs done
Next: ...
```

**Step 3. Before each lab, read the topic's notes** (5 to 10 minutes). The
full list of topics is in [ROADMAP.md](ROADMAP.md).

That's it. Repeat for the next topic.

## How long it takes

About 4 to 5 months at 1 to 2 hours a day. Go at your own pace.
Skip the topics marked **Later** on your first pass; come back for them when you are ready.

## Stuck?

- Read the lab's **Hint** section.
- Look at the [cheatsheets](cheatsheets/).
- Run `./roadmap help` to see all commands.
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
