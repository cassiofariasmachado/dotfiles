#!/usr/bin/env bash

set -euo pipefail

os="$(uname)"

if [[ "$os" != "Darwin" && "$os" != "Linux" ]]; then
  exit 0
fi

if ! command -v brew >/dev/null 2>&1; then
  exit 0
fi

default_brewfile="$HOME/.Brewfile"
profile_brewfile="$HOME/.Brewfile-${PROFILE:-}"

if [[ -s "$default_brewfile" ]]; then
  echo "✨ installing default Homebrew packages"
  brew bundle --file "$default_brewfile"
fi

if [[ -n "${PROFILE:-}" && -s "$profile_brewfile" ]]; then
  echo "✨ installing Homebrew packages for ${PROFILE:-} profile"
  brew bundle --file "$profile_brewfile"
fi
