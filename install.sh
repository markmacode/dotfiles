#!/usr/bin/env bash

# Generate dotfiles env vars or source it.
# We put it inside .config/env.sh because I don't want it messing with
# any symlinked dirs more deeply nested inside .config/
env_file="$HOME/.config/env.sh"
if [[ ! -f "$env_file" ]]; then
    export DOTFILES="$(pwd)"
    mkdir -p "$HOME/.config/"
    echo "# WARNING: Auto-generated from $DOTFILES/build.sh" >>"$env_file"
    echo "export DOTFILES=\"$DOTFILES\"" >>"$env_file"
fi

[[ -z "$DOTFILES_OS" ]] && source "$DOTFILES/scripts/os.sh"

# Do Windows stuff and get out of the way
if [[ "$DOTFILES_OS" == "mingw" ]]; then
    export MSYS="winsymlinks:nativestrict"
    mkdir -p "$HOME/.config"

    if [[ -d "$DOTFILES/home/intel/.config/work/" ]]; then
        ln -s -t "$HOME/.config" "$DOTFILES/home/intel/.config/work/"
        ln -s -t "$HOME" "$HOME/.config/work/.gitconfig"
        ln -s "$DOTFILES/home/git/.gitconfig" "$HOME/.gitconfig.personal"
    fi

    find "$DOTFILES/home/shell/" -type f -exec ln -s -t "$HOME/" {} \;
    find "$DOTFILES/home/git/" -type f -exec ln -s -t "$HOME/" {} \;
    ln -s -t "$HOME/.config" "$DOTFILES/home/starship/.config/starship.toml"
    ln -s -t "$HOME/.config" "$DOTFILES/home/nvim/.config/nvim/"
    ln -s -t "$HOME/.config" "$DOTFILES/home/mbromell/.config/mbromell/"
    exit 0
fi

function stow_helper() {
    stow_dir="$1"
    stow_files="$(ls "$DOTFILES/${stow_dir}/" | tr "\n" " ")"
    pushd "$DOTFILES/${stow_dir}/"
    for dir in $stow_files; do
        echo "[+] Stowing :: $dir"
        # Ignore pointless bug warnings
        # https://github.com/aspiers/stow/issues/65#issuecomment-1465060710
        stow -t "$HOME" -D "$dir" \
            2> >(grep -v -E 'BUG in find_stowed_path|perl:|LANG|LC_ALL|are supported' 1>&2)
        stow -t "$HOME" "$dir" \
            2> >(grep -v -E 'BUG in find_stowed_path|perl:|LANG|LC_ALL|are supported' 1>&2)
    done
    popd
}

if [[ "$DOTFILES_OS" == "mac" ]]; then
    stow_helper home
fi

#"$DOTFILES/scripts/setup-nvim.sh"
