#!/usr/bin/env bash

function dotpull() {
    pushd $DOTFILES
    echo "[+] Pulling latest changes"
    git pull
    popd
    return 0
}

function dotstow() {
    pushd $DOTFILES
    ./install.sh
    return 0
}

function dotedit() {
    pushd $DOTFILES
    echo "[+] Opening $DOTFILES"
    $EDITOR $DOTFILES
    popd
    return 0
}
