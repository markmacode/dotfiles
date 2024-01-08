#!/usr/bin/env bash

# This is not up to date, use at your own risk.

pushd ./home
stow_files="$(ls -d */)"
for dir in $(echo "$stow_files"); do
    echo "[+] Unstowing :: $dir"
    # Ignore pointless bug warnings
    # https://github.com/aspiers/stow/issues/65#issuecomment-1465060710
    stow -t $HOME -D $dir \
        2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2)
done
popd

rm -rf $HOME/.config/mbromell
