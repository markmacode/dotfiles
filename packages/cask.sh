#!/usr/bin/env bash

if ! command -v brew &>/dev/null; then
    echo "[+] Installing Homebrew"
    NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

xargs brew install --cask < $DOTFILES/packages/cask.txt
brew cleanup
