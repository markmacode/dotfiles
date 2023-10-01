#!/usr/bin/env bash

pushd $DOTFILES
stow_files="$(ls -d */)"
for dir in $(echo "$stow_files"); do
    echo "[+] Directory :: $dir"
    stow -t $HOME -D $dir
    stow -t $HOME $dir
done
popd

pushd $DOTFILES/.os/$DOTFILES_OS
stow_files="$(ls -d */)"
for dir in $(echo "$stow_files"); do
    echo "[+] Directory :: $dir"
    stow -t $HOME -D $dir
    stow -t $HOME $dir
done
popd
