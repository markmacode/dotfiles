#!/usr/bin/env bash

for package in $(cat $DOTFILES/packages/winget.txt | sed 's/\n//'); do
    echo "[+] Installing $package"
    winget install $package
done
