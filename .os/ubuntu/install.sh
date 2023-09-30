#!/usr/bin/env bash

$DOTFILES/ubuntu/sync.sh

echo "[+] Setting ZSH as default shell"
chsh -s $(which zsh)
