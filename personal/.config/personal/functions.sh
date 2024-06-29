#!/usr/bin/env bash

# Run yazi through `yy` and when you close it it will cd into the selected
# directory on yazi
function yy {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# This function is context aware, just run `pyv` to create, activate, and
# deactivate your virtual env
# pyv [venv_dir]
function pyv {
  local venv_dir="${1:-.venv}"
  if [[ ! -d $venv_dir ]]; then
    # Create the virtual environment dir if it is not there.
    python3 -m venv $venv_dir
  fi
  if [[ -z $VIRTUAL_ENV ]]; then
    # Activate the venv dir if one is not active.
    source $venv_dir/bin/activate
    return 0
  fi
  if [[ ! -z $VIRTUAL_ENV ]] && [[ ! -z $1 ]]; then
    # Virtual env is active but an arg is specified, switch environments.
    deactivate
    source $venv_dir/bin/activate
    return 0
  fi
  # No arg specified and virtual environment is active, so deactivate.
  deactivate
  return 0
}

function gi() {
  curl -sL https://www.toptal.com/developers/gitignore/api/$@
}
