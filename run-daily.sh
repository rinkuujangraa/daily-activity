#!/usr/bin/env bash
set -euo pipefail

# Runs the daily update and pushes it. Called by launchd (see the plist).
# Logs go to daily.log so you can see what happened on each run.

REPO_DIR="/Users/rinkuu/Desktop/github"
cd "$REPO_DIR"

{
  echo "=== run at $(date -u '+%Y-%m-%d %H:%M:%S UTC') ==="
  bash update.sh
  git add -A
  if git diff --cached --quiet; then
    echo "nothing to commit"
  else
    git commit -m "daily activity: $(date -u '+%Y-%m-%d')"
    git push origin main
    echo "pushed"
  fi
} >> "$REPO_DIR/daily.log" 2>&1
