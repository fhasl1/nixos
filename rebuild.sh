#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

HOST="${1:-$(hostnamectl hostname)}"

git pull
sudo nixos-rebuild switch --flake ".#$HOST" --impure "${@:2}"

git add -A
if ! git diff --cached --quiet; then
  git commit -m "nixos: update $(date +%Y-%m-%d_%H-%M-%S)"
  git push origin main
fi
