#!/usr/bin/env bash

function dotpull() {
    pushd $DOTFILES
    echo "[+] Pulling latest changes"
    git pull
    popd
}

function dotstow() {
    pushd $DOTFILES
    echo "[+] Stowing dotfiles"
    ./stow.sh
    popd
}

function dotsync() {
    pushd $DOTFILES
    echo "[+] Syncing packages"
    ./sync.sh
    popd
}
