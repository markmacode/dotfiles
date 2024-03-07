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
if [[ "$DOTFILES_OS" == "windows" ]]; then
    # mkdir -p \
    #     "$HOME/.config/wezterm/" \
    #     "$HOME/.config/intel/" \
    #     "$HOME/.config/mbromell/" \
    #     "$HOME/.config/nvim/" \
    #     "$HOME/AppData/Local/nvim/"
    # rsync -av "$DOTFILES/home/shell/" "$HOME/"
    # rsync -av "$DOTFILES/home/wezterm/.config/" "$HOME/.config/"
    # rsync -av "$DOTFILES/home/git/" "$HOME/"
    # rsync -av "$DOTFILES/home/intel/.config/" "$HOME/.config/"
    # rsync -av "$DOTFILES/home/mbromell/.config/" "$HOME/.config/"
    # rsync -av "$DOTFILES/home/nvim/.config/" "$HOME/.config/"
    # rsync -av "$DOTFILES/home/nvim/.config/nvim/" "$HOME/AppData/Local/nvim/"
    mkdir -p "$HOME/.config"
    ln -s -t "$HOME/" "$DOTFILES/home/shell/*"
    ln -s -t "$HOME/" "$DOTFILES/home/git/*"
    ln -s -t "$HOME/.config" "$DOTFILES/home/nvim/.config/nvim/"
    ln -s -t "$HOME/.config" "$DOTFILES/home/wezterm/.config/wezterm/"
    ln -s -t "$HOME/.config" "$DOTFILES/home/mbromell/.config/mbromell/"
    if [[ -d "$DOTFILES/home/intel/.config/work/" ]]; then
        ln -s -t "$HOME/.config" "$DOTFILES/home/intel/.config/work/"
    fi
    exit 0
fi

function stow_helper() {
    stow_dir="$1"
    stow_files="$(ls "$DOTFILES/${stow_dir}/" | tr "\n" " ")"
    pushd "$DOTFILES/${stow_dir}/"
    for dir in "$stow_files"; do
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

stow_helper home

#"$DOTFILES/scripts/setup-nvim.sh"
