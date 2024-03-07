#!/usr/bin/env bash

source ./scripts/os.sh
if [[ "$DOTFILES_OS" == "mingw" ]]; then
    echo "[+] MingW build"
    ./packages/winget.sh
    exit 0
elif [[ "$DOTFILES_OS" == "mac" ]]; then
    echo "[+] MacOS build"
    ./packages/brew.sh
    ./packages/cask.sh
fi

./install.sh

echo "[+] Restart terminal"
