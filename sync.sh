#!/usr/bin/env bash

pushd $DOTFILES
stow_files="$(ls -d */)"
for folder in $(echo "$stow_files"); do
    echo "[+] Directory :: $folder"
    stow -t $HOME -D $folder
    stow -t $HOME $folder
done
popd

pushd $DOTFILES/.os/$DOTFILES_OS
stow_files="$(ls -d */)"
for folder in $(echo "$stow_files"); do
    echo "[+] Directory :: $folder"
    stow -t $HOME -D $folder
    stow -t $HOME $folder
done

./sync.sh
popd
