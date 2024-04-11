#!/usr/bin/env bash

# Take each dir or file insdie the `dotfile_dir` and stow it to 
# the `target` path.
function stow_helper() {
    stow_dir="$1"
    paths="$(ls "${stow_dir}" | tr "\n" " ")"
    pushd "${stow_dir}"
    for path in $paths; do
        echo "[+] Stowing :: $path"
        stow  --target="$HOME" --restow "$path"
    done
    popd
}

stow_helper ./home

#"$DOTFILES/scripts/setup-nvim.sh"
