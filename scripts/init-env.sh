#!/usr/bin/env bash

export DOTFILES="$(pwd)"
export DOTFILES_OS="basic"
echo "[+] DOTFILES=${DOTFILES}"

if [[ "$1" == "--full" ]]; then
    if [[ -f /etc/os-release ]]; then
        release="$(awk -F= '/^NAME/{print $2}' /etc/os-release | sed s/\"//g)"
    fi

    if [[ "$(uname -s)" == "Darwin" ]]; then
        export DOTFILES_OS="mac"
    elif [[ "${release}" == "Debian GNU/Linux" ]]; then
        export DOTFILES_OS="debian"
    fi
fi

echo "[+] DOTFILES_OS=${DOTFILES_OS}"

export DOTFILES_STOW="$(cat ${DOTFILES}/stow/${DOTFILES_OS}.txt | tr "\n" " ")"
echo "[+] DOTFILES_STOW=\"${DOTFILES_STOW}\""
