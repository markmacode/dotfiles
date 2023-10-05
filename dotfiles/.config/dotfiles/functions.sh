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
    stow_files="$(ls -d */)"
    for dir in $(echo "$stow_files"); do
        echo "[+] Stowing :: $dir"
        # Ignore pointless bug warnings
        # https://github.com/aspiers/stow/issues/65#issuecomment-1465060710
        stow -t $HOME -D $dir \
            2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2)
        stow -t $HOME $dir
    done
    popd
    return 0
}

function dotnix() {
    pushd $DOTFILES/dotfiles/.config/dotfiles
    echo "[+] Opening $DOTFILES/dotfiles/.config/dotfiles/packages.nix"
    nvim packages.nix
    echo "[+] Installing packages $DOTFILES/dotfiles/.config/dotfiles/packages.nix"
    nix-env -if packages.nix
    popd
    return 0
}

function dotedit() {
    pushd $DOTFILES
    echo "[+] Opening $DOTFILES"
    nvim $DOTFILES
    popd
    return 0
}

alias dotsync="dotpull && dotnix && dotstow"
