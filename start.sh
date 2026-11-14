#!/usr/bin/env bash
set -euo pipefail

REPO="aaronpo97/the-biergarten-app"

gh auth status &>/dev/null || gh auth login

export RUNNER_TOKEN=$(gh api -X POST "repos/${REPO}/actions/runners/registration-token" --jq .token)

docker compose up -d
