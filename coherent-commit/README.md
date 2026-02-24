# Coherent Commit

Meaning-first git commits. Plain language, one file at a time, readable by humans and machines.

## What this is

Coherent Commit is a commit convention built for understanding. Every commit is a complete sentence. Every file gets its own commit. The history reads like a story.

**Conventional Commits** are machine-first -- structured prefixes (`feat:`, `fix:`, `chore:`) designed for changelogs, semver bumps, and CI triggers.

**Coherent Commit** is meaning-first -- plain language designed so anyone can open the commit history and follow what happened and why. Developers, managers, clients, AI agents -- all the same history, no translation needed.

## How it works

This repo is an [Agent Skill](https://agentskills.io) that any compatible AI agent can load. It enforces commit hygiene through seven operations:

| Operation | When to use |
|---|---|
| `declare` | Adding a new file |
| `update` | Changing an existing file |
| `connect` | Linking to an external system or dependency |
| `checkpoint` | Saving a named state you can return to |
| `reset` | Returning to the last checkpoint |
| `commit-file` | Staging and committing a single file |
| `commit-plan` | Walking through a list of files, committing each individually |

Every commit message is validated before it reaches git. Messages must be at least 24 characters, at least 5 words, no conventional commit prefixes, no placeholders like `wip` or `update`.

## Install as an Agent Skill

Copy or clone this repo into your project's `.github/skills/` directory:

```
.github/skills/coherent-commit/
├── SKILL.md
└── scripts/
    ├── validate-message.sh
    ├── declare.sh
    ├── update.sh
    ├── connect.sh
    ├── checkpoint.sh
    └── reset.sh
```

Any agent that supports the [Agent Skills specification](https://agentskills.io/specification) will discover it automatically.

For Claude Code specifically, you can also place it in `.claude/skills/coherent-commit/`.

## Use without an agent

The scripts work standalone. No agent required.

```bash
# Add a new file
scripts/declare.sh docs onboarding-guide.md "Add the onboarding guide so new hires have a single starting point"

# Update an existing file
scripts/update.sh docs/onboarding-guide.md "Update the onboarding guide to reflect the new three-step process"

# Save a checkpoint before something risky
scripts/checkpoint.sh "everything clean before the API refactor"

# Go back if it didn't work out
scripts/reset.sh
```

## Commit message rules

Messages are written for someone arriving with no context six months from now.

**Good:**
- `Add the Stripe integration spec so payment flows are documented in one place`
- `Update the onboarding guide to reflect the new three-step process`

**Never:**
- `feat: add spec`
- `update file`
- `wip`

The validation script (`scripts/validate-message.sh`) enforces these rules and gives specific feedback when a message doesn't pass.

## License

MIT. See [LICENSE](LICENSE).
