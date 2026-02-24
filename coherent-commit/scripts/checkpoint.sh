#!/usr/bin/env bash
# checkpoint.sh — tags the current state so reset.sh can return here
# Usage: checkpoint.sh "<label>"

set -e

LABEL="$1"

if [ -z "$LABEL" ]; then
  echo "Usage: checkpoint.sh \"<label>\""
  echo "Example: checkpoint.sh \"before restructuring domains\""
  exit 1
fi

# Checkpoint labels don't go through full commit message validation
# but the commit itself still gets a clear, descriptive message
COMMIT_MSG="Checkpoint: $LABEL"
if [ ${#COMMIT_MSG} -lt 20 ]; then
  echo "Label too short. Describe the state you're saving."
  echo "Example: checkpoint.sh \"everything clean after the API refactor\""
  exit 1
fi

# Sanitize label for use as a git tag (replace spaces with dashes, lowercase)
TAG="checkpoint-$(echo "$LABEL" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M")

git tag -a "$TAG" -m "Checkpoint: $LABEL -- $TIMESTAMP"

# Write the tag name to a temp file so reset.sh knows where to go
echo "$TAG" > .last-checkpoint

git add .last-checkpoint
git commit -m "$COMMIT_MSG"

echo "Checkpointed as: $TAG"
echo "To return here, run: scripts/reset.sh"
