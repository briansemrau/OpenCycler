#!/usr/bin/env sh
set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

if command -v pipx >/dev/null 2>&1; then
  pipx install --force "$project_dir"
else
  venv_dir="${HOME}/.local/share/opencycler-venv"
  python3 -m venv "$venv_dir"
  "$venv_dir/bin/python" -m pip install --upgrade pip
  "$venv_dir/bin/pip" install --upgrade "$project_dir"
  mkdir -p "$HOME/.local/bin"
  ln -sf "$venv_dir/bin/opencycler" "$HOME/.local/bin/opencycler"
fi

if ! printf "%s" "${PATH:-}" | tr ":" "\n" | grep -qx "$HOME/.local/bin"; then
  echo ""
  echo "Note: add \$HOME/.local/bin to your PATH to run 'opencycler' from anywhere."
fi
