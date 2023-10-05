#!/usr/bin/env bash

function dotpull() {
    pushd $DOTFILES
    echo "[+] Pulling latest changes"
    git pull
    popd
}

function dotstow() {
    pushd $DOTFILES
    stow_files="$(ls -d */)"
    for dir in $(echo "$stow_files"); do
        echo "[+] Stowing :: $dir"
        stow -t $HOME -D $dir
        stow -t $HOME $dir
    done
    popd
}

function dotnix() {
    pushd $DOTFILES/dotfiles/.config/dotfiles
    echo "[+] Installing packages $DOTFILES/dotfiles/.config/dotfiles/packages.nix"
    nix-env -if packages.nix
    popd
}

function dotedit() {
    echo "[+] Opening $DOTFILES"
    nvim $DOTFILES
}

function dotnixedit() {
    echo "[+] Opening $DOTFILES/dotfiles/.config/dotfiles/packages.nix"
    nvim $DOTFILES/dotfiles/.config/dotfiles/packages.nix
}

alias dotsync="dotpull && dotstow && dotnix"
