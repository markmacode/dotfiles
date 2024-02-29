#!/usr/bin/env bash

if ! command -v brew &>/dev/null; then
    echo "[+] Installing Homebrew"
    NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

for package in $(cat $DOTFILES/packages/cask.txt | sed 's/\n//'); do
    echo "[+] Installing $package"
    brew install --cask $package
done

brew cleanup