#!/usr/bin/env bash
# validate-message.sh — enforces commit message rules from the Coherent Commit spec
# Sourced by other scripts. Call: validate_message "<message>"
# Returns 0 if valid, exits 1 with explanation if not.

validate_message() {
  local MSG="$1"
  local LEN=${#MSG}
  local WORD_COUNT
  WORD_COUNT=$(echo "$MSG" | wc -w | tr -d ' ')

  # Minimum 24 characters
  if [ "$LEN" -lt 24 ]; then
    echo "Commit message too short ($LEN chars, minimum 24)."
    echo "A good message is a complete sentence: what changed and why it matters."
    return 1
  fi

  # Maximum 180 characters
  if [ "$LEN" -gt 180 ]; then
    echo "Commit message too long ($LEN chars, maximum 180)."
    echo "Keep it to one clear sentence. Move detail into the file itself."
    return 1
  fi

  # At least 5 words
  if [ "$WORD_COUNT" -lt 5 ]; then
    echo "Commit message too vague ($WORD_COUNT words, minimum 5)."
    echo "Say what changed and why. Example: \"Add the onboarding guide so new hires have a starting point\""
    return 1
  fi

  # No conventional commit prefixes
  if echo "$MSG" | grep -qE "^(feat|fix|chore|docs|style|refactor|perf|test|build|ci|revert|wip)(\(.*\))?:"; then
    echo "No conventional commit prefixes (feat:, fix:, chore:, etc.)."
    echo "Write a plain sentence instead. Example: \"Fix the login timeout so sessions survive browser refresh\""
    return 1
  fi

  # No placeholder messages
  local LOWER
  LOWER=$(echo "$MSG" | tr '[:upper:]' '[:lower:]')
  case "$LOWER" in
    update|changes|misc|wip|fix|cleanup|refactor|"work in progress"|"minor changes"|"small fix")
      echo "Commit message is a placeholder: \"$MSG\""
      echo "Say what actually changed. A stranger should understand this six months from now."
      return 1
      ;;
  esac

  return 0
}
