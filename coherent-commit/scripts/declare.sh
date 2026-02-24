#!/usr/bin/env bash
# declare.sh — adds a new file and commits it with a plain-language message
# Usage: declare.sh <folder> <filename> "<commit message>"

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/validate-message.sh"

FOLDER="$1"
FILENAME="$2"
MESSAGE="$3"

if [ -z "$FOLDER" ] || [ -z "$FILENAME" ] || [ -z "$MESSAGE" ]; then
  echo "Usage: declare.sh <folder> <filename> \"<commit message>\""
  echo "Example: declare.sh docs onboarding-guide.md \"Add the onboarding guide so new hires have a single starting point\""
  exit 1
fi

validate_message "$MESSAGE" || exit 1

FILEPATH="$FOLDER/$FILENAME"

if [ -f "$FILEPATH" ]; then
  echo "File already exists: $FILEPATH"
  echo "Use update.sh to modify existing files."
  exit 1
fi

# Create the folder if it doesn't exist
mkdir -p "$FOLDER"

# Create the file (agent fills content before this runs, or we stub it)
if [ ! -f "$FILEPATH" ]; then
  touch "$FILEPATH"
fi

# Warn if the file is empty — likely means content wasn't written first
if [ ! -s "$FILEPATH" ]; then
  echo "Warning: $FILEPATH is empty. Writing content before committing is recommended."
  echo "Proceeding with empty file — you can update it later with update.sh."
fi

git add "$FILEPATH"
git commit -m "$MESSAGE"

echo "Declared: $FILEPATH"
echo "Committed: $MESSAGE"
