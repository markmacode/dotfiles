#!/usr/bin/env bash

if [ ! -f "$HOME/.config/dotfiles/env" ]; then
    function exists_in_list() {
        LIST=$1
        VALUE=$2
        for x in $LIST; do
            if [ "$x" = "$VALUE" ]; then
                return 0
            fi
        done
        return 1
    }

    export DOTFILES="$(pwd)"
    export DOTFILES_OS="$1"
    os_list="$(ls $DOTFILES/.os | tr "\n" " ")"

    if exists_in_list "$os_list" "$1"; then
        echo "[+] Running $DOTFILES/.os/$DOTFILES_OS/install.sh"
        $DOTFILES/.os/$DOTFILES_OS/install.sh
    else
        echo "OS List (from .os/*): ${os_list}"
        echo
        echo "Example:"
        echo "./install.sh ubuntu"
        echo
        exit 1
    fi

    # -- Global installs --

    # Setting config vars
    mkdir -p $HOME/.config/dotfiles/
    echo "# AUTO GENERATED FROM ${DOTFILES}/install.sh"
    echo "export DOTFILES=\"${DOTFILES}\"" >> $HOME/.config/dotfiles/dotrc
    echo "export DOTFILES_OS=\"${DOTFILES_OS}\"" >> $HOME/.config/dotfiles/dotrc

    # Install oh-my-zsh
    echo "[+] Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Sync
$DOTFILES/sync.sh

