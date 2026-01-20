#!/usr/bin/env sh
set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

venv_dir="/opt/opencycler-venv"
python3 -m venv "$venv_dir"
"$venv_dir/bin/python" -m pip install --upgrade pip
"$venv_dir/bin/pip" install --upgrade "$project_dir"
ln -sf "$venv_dir/bin/opencycler" "/usr/local/bin/opencycler"

if ! printf "%s" "${PATH:-}" | tr ":" "\n" | grep -qx "/usr/local/bin"; then
  echo ""
  echo "Note: add /usr/local/bin to your PATH to run 'opencycler' from anywhere."
fi