#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

HOST="${1:-$(hostnamectl hostname)}"

git pull

sudo nixos-rebuild switch --flake ".#$HOST" "${@:2}" || exit 1

git add -A

if git diff --cached --quiet; then
  echo "No NixOS changes to commit."
  exit 0
fi

git commit -m "nixos: update $(date +%Y-%m-%d_%H-%M-%S)"
git push origin main
