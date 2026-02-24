#!/usr/bin/env bash
# connect.sh — declares a new external connection and commits
# Usage: connect.sh <name> "<commit message>"

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/validate-message.sh"

NAME="$1"
MESSAGE="$2"

if [ -z "$NAME" ] || [ -z "$MESSAGE" ]; then
  echo "Usage: connect.sh <name> \"<commit message>\""
  echo "Example: connect.sh stripe-api \"Connect the Stripe API so payment flow documentation lives alongside the code\""
  exit 1
fi

validate_message "$MESSAGE" || exit 1

FILEPATH="connectors/$NAME.md"

if [ -f "$FILEPATH" ]; then
  echo "Connection already exists: $FILEPATH"
  echo "Use update.sh to modify it."
  exit 1
fi

mkdir -p connectors
touch "$FILEPATH"

git add "$FILEPATH"
git commit -m "$MESSAGE"

echo "Connected: $FILEPATH"
echo "Committed: $MESSAGE"
