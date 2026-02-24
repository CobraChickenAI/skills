#!/usr/bin/env bash
# update.sh — commits changes to an existing file with a plain-language message
# Usage: update.sh <filepath> "<commit message>"

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/validate-message.sh"

FILEPATH="$1"
MESSAGE="$2"

if [ -z "$FILEPATH" ] || [ -z "$MESSAGE" ]; then
  echo "Usage: update.sh <filepath> \"<commit message>\""
  echo "Example: update.sh docs/onboarding-guide.md \"Update the onboarding guide to reflect the new three-step process\""
  exit 1
fi

validate_message "$MESSAGE" || exit 1

if [ ! -f "$FILEPATH" ]; then
  echo "File not found: $FILEPATH"
  echo "Use declare.sh to create new files."
  exit 1
fi

git add "$FILEPATH"
git commit -m "$MESSAGE"

echo "Updated: $FILEPATH"
echo "Committed: $MESSAGE"
