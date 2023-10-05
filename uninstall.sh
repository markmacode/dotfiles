#!/usr/bin/env bash

pushd $DOTFILES
stow_files="$(ls -d */)"
for dir in $(echo "$stow_files"); do
    echo "[+] Unstowing :: $dir"
    stow -t $HOME -D $dir
done
popd

echo "[+] Removing $HOME/.dotrc"
rm $HOME/.dotrc
