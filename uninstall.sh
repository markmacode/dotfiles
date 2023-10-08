#!/usr/bin/env bash

pushd ./home
for dir in ${DOTFILES_STOW:-"git" "mbromell" "nvim" "zsh"}; do
    echo "[+] Unstowing :: $dir"
    # Ignore pointless bug warnings
    # https://github.com/aspiers/stow/issues/65#issuecomment-1465060710
    stow -t $HOME -D $dir \
        2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2)
done
popd

rm -rf $HOME/.config/mbromell
echo "[+] Run 'unset DOTFILES && unset DOTFILES_OS && unset DOTFILES_STOW'"
