#!/usr/bin/env bash

export DOTFILES="$(pwd)"
export DOTFILES_OS="unknown"

if [[ -f /etc/os-release ]]; then
    release="$(awk -F= '/^NAME/{print $2}' /etc/os-release | sed s/\"//g)"
fi

if [[ "$(uname -s)" == "Darwin" ]]; then
    export DOTFILES_OS="mac"
elif [[ "${release}" == "Debian GNU/Linux" ]]; then
    export DOTFILES_OS="debian"
fi
