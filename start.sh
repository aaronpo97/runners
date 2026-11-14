#!/usr/bin/env bash
set -euo pipefail

REPO="aaronpo97/the-biergarten-app"
RUNNERS="${1:-1}"

gh auth status &>/dev/null || gh auth login

export RUNNER_TOKEN=$(gh api -X POST "repos/${REPO}/actions/runners/registration-token" --jq .token)

docker compose up --scale worker="$RUNNERS"
