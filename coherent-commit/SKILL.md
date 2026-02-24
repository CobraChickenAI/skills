---
name: coherent-commit
description: "Meaning-first git commits. Plain language, one file at a time, readable by humans and machines. Use instead of raw git -- this skill enforces commit hygiene that makes history documentation. Use for every git operation. Never run raw git add, git commit, or git push -- always route through coherent-commit."
license: MIT
compatibility: "Requires git"
allowed-tools: Bash
metadata:
  author: Michael Schartung
  repository: CobraChickenAI/coherent-commit
  version: "2.0.0"
---

# Coherent Commit

Coherent Commit is a meaning-first approach to version control. Every commit is a complete sentence in plain language. Every file gets its own commit. The history reads like a story — not a developer's shorthand.

This is different from what you might be used to. Conventional commits were built for machines — changelogs, semver bumps, CI triggers. Coherent Commit is built for understanding. A non-technical person can open the commit history and know what happened. An AI agent can read it and reconstruct the reasoning. A new team member can scroll back and follow the project from its first file.

This skill handles all the git ceremony so no one gets stuck in git hell. Seven operations cover everything. Pick the right one and the skill handles the rest.

## The Seven Operations

### 1. declare
Use when something new is being added — a new file in any folder.

Runs: `scripts/declare.sh <folder> <filename> "<message>"`

Example invocations:
- "declare a new integration spec for the CRM"
- "declare the authentication module"
- "declare a policy: no deploys on Fridays"

### 2. update
Use when an existing file is being changed.

Runs: `scripts/update.sh <filepath> "<message>"`

Example invocations:
- "update the API spec with the new rate limits"
- "update the onboarding doc to reflect the new workflow"

### 3. connect
Shorthand for declaring a new external connection. Use when linking this repo to an outside system, tool, or dependency.

Runs: `scripts/connect.sh <name> "<message>"`

Example invocations:
- "connect the Stripe integration"
- "connect our shared Google Drive"

### 4. checkpoint
Saves a named, tagged state you can always return to. Run this before anything structural or experimental. Lightweight — just a tag and a clear message.

Runs: `scripts/checkpoint.sh "<name>"`

Example invocations:
- "checkpoint before restructuring the project folders"
- "checkpoint — everything is clean right now"

### 5. reset
Returns the repo to the last checkpoint. No drama, no data loss beyond anything since the checkpoint.

Runs: `scripts/reset.sh`

Example invocations:
- "reset to last checkpoint"
- "I changed my mind, get back to clean"

### 6. commit-file
Stage and commit a single file with a plain-language description. The simplest operation — one file, one sentence.

Runs: `git add <filepath> && git commit -m "<message>"`

Example invocations:
- "commit the updated README with a note about what changed"
- "commit the new test file explaining what it covers"

### 7. commit-plan
Walk through a list of files and commit each one individually with its own message. The history tells a story — each commit is a chapter. Use this when initializing a repo or landing a batch of related changes.

Runs: For each entry in the plan: `git add <file> && git commit -m "<message>"`

Example invocations:
- "run the commit plan" (when a COMMIT-PLAN.md exists in the repo)
- "commit these files one at a time, each with its own message"

---

## Commit Message Rules

Messages are written for a human arriving with no context six months from now. They are complete sentences in plain English. They say what changed and why it matters.

**Good:**
- `Add the Stripe integration spec so payment flows are documented in one place`
- `Update the onboarding guide to reflect the new three-step process`
- `Checkpoint before restructuring the project folders`

**Never:**
- `feat: add spec`
- `update file`
- `wip`
- `fix`

**Enforcement (validated by `scripts/validate-message.sh`, sourced by all scripts):**
- Minimum 24 characters, maximum 180
- At least 5 words
- No conventional commit prefixes (`feat:`, `chore:`, `fix:`, etc.)
- No placeholders (`update`, `changes`, `misc`)

Every script validates the message before committing. If validation fails, the script exits with a specific explanation and a rewrite suggestion — no commit is created.

---

## File Naming

Filenames are lowercase with hyphens. They should read like headlines — descriptive enough to understand without opening the file.

Good filenames:
- `integrations/stripe-payments.md`
- `docs/onboarding-guide.md`
- `policies/no-friday-deploys.md`

Bad filenames:
- `new-file.md`
- `draft2-final-v3.md`
- `misc.md`

---

## When Something Goes Wrong

Do not attempt raw git commands. Run `scripts/reset.sh` to return to the last checkpoint. If reset isn't sufficient, stop and describe the current state of the repo before doing anything else.

---

## Why This Exists

Git history is documentation. Most teams treat it like a recycling bin — `fix`, `wip`, `update`, `feat: thing`. Six months later, nobody can reconstruct what happened or why.

Coherent Commit treats every commit as a line in a narrative. The person reading the history — whether they're a developer, a manager, a client, or an AI agent — should be able to follow the story from first commit to last without opening a single file.

This is a bridge between technical users and non-technical users. Between humans and machines. Between the person who wrote the code and the person who needs to understand what it does.

Conventional Commits: machine-first — structured prefixes for automation.
Coherent Commit: meaning-first — plain language for understanding.
