#!/usr/bin/env bash
# reset.sh — returns the repo to the last checkpoint
# Usage: reset.sh

set -e

if [ ! -f ".last-checkpoint" ]; then
  echo "No checkpoint found. Run scripts/checkpoint.sh first to save a safe state."
  exit 1
fi

TAG=$(cat .last-checkpoint)

echo "Resetting to checkpoint: $TAG"
echo "Everything since that checkpoint will be gone. Proceed? (y/n)"
read -r CONFIRM

if [ "$CONFIRM" != "y" ]; then
  echo "Reset cancelled."
  exit 0
fi

git reset --hard "$TAG"

echo "Returned to: $TAG"
echo "Repo is clean."
