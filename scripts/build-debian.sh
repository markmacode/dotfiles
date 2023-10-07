#!/usr/bin/env bash

sudo apt update
sudo apt upgrade

echo "[+] Installing APT packages:"
echo "$(cat $DOTFILES/packages/apt.txt)"
xargs sudo apt install -y < $DOTFILES/packages/apt.txt

${DOTFILES}/scripts/init-zsh.sh
