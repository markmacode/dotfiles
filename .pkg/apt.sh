#!/usr/bin/env bash

sudo apt update
sudo apt upgrade

echo "[+] Installing APT packages:"
echo "[+] $(cat $DOTFILES/.os/ubuntu/packages | tr "\n" " ")"
xargs sudo apt install -y < $DOTFILES/.os/ubuntu/packages
