#!/usr/bin/env bash

echo "[+] Installing Brew packages:"
echo "[+] $(cat $DOTFILES/.pkg/brew.txt | tr "\n" " ")"
xargs brew install < $DOTFILES/.pkg/brew.txt

echo "[+] Running brew cleanup"
brew cleanup
