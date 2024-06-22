#!/usr/bin/env bash

# Making backups of important files
# If things break, I can just restore working versions of these
for dir in "$HOME/.config/wezterm" "$HOME/.config/nvim"; do
  if [[ ! -L "$dir" ]] && [[ -d "$dir" ]]; then
    mv "$dir" "${dir}.bak"
  fi
done
for file in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.gitconfig"; do
  if [[ ! -L "$file" ]] && [[ -f "$file" ]]; then
    mv "$file" "${file}.bak"
  fi
done

pushd $HOME/dotfiles
for dir in $(fd -t d -d 1 . | sed 's/.$//'); do
  echo "stowing $dir"
  stow -t "$HOME" -R $dir
done
popd
