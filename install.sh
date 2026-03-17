#!/usr/bin/env bash

set -e

PROFILE=""
SHOW_HELP=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --work| -w)
      PROFILE="work"
      shift
      ;;
    --personal| -p)
      PROFILE="personal"
      shift
      ;;
    --help | -h)
      SHOW_HELP=true
      break
      ;;
    *)
      shift
      ;;
  esac
done

if $SHOW_HELP; then
  cat << EOF
Installs the dotfiles configuration.

Usage:
  $(readlink -f "$0") [flags]

Flags:
  --work, -w                                 Use work profile
  --personal, -p                             Use personal profile
  -h, --help                                 Show help
EOF
  exit 0
fi

if [[ -z "$PROFILE" ]]; then
  echo "Error: profile not selected. Use --personal/-p or --work/-w." >&2
  exit 1
fi

export PROFILE

CONFIG="install.conf.yaml"
DOTBOT_DIR="external/dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"

unset PROFILE
