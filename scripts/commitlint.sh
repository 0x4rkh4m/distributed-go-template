#!/bin/bash

commit_msg_file="$1"

conventional_commit_regex="^(feat|fix|docs|style|refactor|perf|test|chore|build|ci|revert)(\(.+\))?: .{1,50}"

if ! grep -qE "$conventional_commit_regex" "$commit_msg_file"; then
  echo "ERROR: Commit message does not follow Conventional Commits standard."
  echo "Examples: "
  echo "  feat: add new feature"
  echo "  feat(scope): add new feature"
  echo "  fix: fix a bug"
  echo "  docs: update documentation"
  exit 1
fi
