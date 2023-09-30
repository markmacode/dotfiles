#!/usr/bin/env bash

echo "[+] Installing packages:"
echo "[+] $(cat $DOTFILES/.os/mac/packages.txt | tr "\n" " ")"
xargs brew install < $DOTFILES/.os/mac/packages.txt

echo "[+] Installing Cask packages:"
echo "[+] $(cat $DOTFILES/.os/mac/packages-cask.txt | tr "\n" " ")"
xargs brew install --cask < $DOTFILES/.os/mac/packages-cask.txt

echo "[+] Running brew cleanup"
brew cleanup
