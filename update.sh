#!/usr/bin/env bash
set -euo pipefail

# Appends a timestamped line to activity.log so each run is a real change to commit.
STAMP="$(date -u '+%Y-%m-%d %H:%M:%S UTC')"
echo "active: $STAMP" >> activity.log
