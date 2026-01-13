#!/usr/bin/env sh
set -eu

python3 -m pip install --user --upgrade .

if ! printf "%s" "${PATH:-}" | tr ":" "\n" | grep -qx "$HOME/.local/bin"; then
  echo ""
  echo "Note: add \$HOME/.local/bin to your PATH to run 'opencycler' from anywhere."
fi
