# Commit Plan: coherent-commit initial publish

Commit each file individually, in this order. The history tells the story of the repo from its first file.

## Order

1. `LICENSE`
   > Add the MIT license so the terms are clear from the first commit

2. `SKILL.md`
   > Add the Coherent Commit skill spec -- the core instructions any agent loads to enforce meaning-first commits

3. `scripts/validate-message.sh`
   > Add the commit message validator that enforces plain-language rules before anything reaches git

4. `scripts/declare.sh`
   > Add the declare operation for committing new files with validation and empty-file warnings

5. `scripts/update.sh`
   > Add the update operation for committing changes to existing files with validation

6. `scripts/connect.sh`
   > Add the connect operation for declaring external connections with validation

7. `scripts/checkpoint.sh`
   > Add the checkpoint operation for tagging safe states to return to

8. `scripts/reset.sh`
   > Add the reset operation for returning to the last checkpoint

9. `README.md`
   > Add the README explaining what Coherent Commit is, how to install it, and how to use it without an agent

10. `COMMIT-PLAN.md`
    > Add this commit plan so the repo documents its own publishing process
