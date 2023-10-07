#!/usr/bin/env bash

pushd ./home
for dir in "git mbromell nvim"; do
    echo "[+] Stowing :: $dir"
    # Ignore pointless bug warnings
    # https://github.com/aspiers/stow/issues/65#issuecomment-1465060710
    stow -t $HOME -D $dir \
        2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2)
    stow -t $HOME $dir
done
popd
