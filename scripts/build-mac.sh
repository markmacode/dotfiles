#!/usr/bin/env bash

if ! command -v brew &> /dev/null; then
    echo "[+] Installing Homebrew"
    NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew tap homebrew/cask-fonts

echo "[+] Installing Brew packages:"
echo "$(cat $DOTFILES/packages/brew.txt)"
xargs brew install < $DOTFILES/packages/brew.txt

echo "[+] Installing Brew Cask packages:"
echo "$(cat $DOTFILES/.pkg/brew-cask.txt)"
xargs brew install --cask < $DOTFILES/packages/brew-cask.txt

echo "[+] Running brew cleanup"
brew cleanup
