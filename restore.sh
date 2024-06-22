#!/usr/bin/env bash

pushd $HOME/dotfiles
for dir in $(fd -t d -d 1 . | sed 's/.$//'); do
  echo "unstowing $dir"
  stow -t "$HOME" -D $dir
done
popd

for dir in "$HOME/.config/wezterm" "$HOME/.config/nvim"; do
  if [[ -d "${dir}.bak" ]]; then
    mv "${dir}.bak" "$dir"
  fi
done
for file in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.gitconfig"; do
  if [[ -f "${file}.bak" ]]; then
    mv "${file}.bak" "$file"
  fi
done
