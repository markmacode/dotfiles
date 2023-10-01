#!/usr/bin/env bash

echo "[+] Installing Brew Cask packages:"
echo "[+] $(cat $DOTFILES/.pkg/brew-cask.txt | tr "\n" " ")"
xargs brew install --cask < $DOTFILES/.pkg/brew-cask.txt

echo "[+] Running brew cleanup"
brew cleanup
