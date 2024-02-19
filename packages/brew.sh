#!/usr/bin/env bash

if ! command -v brew &>/dev/null; then
    echo "[+] Installing Homebrew"
    NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

brew install \
    dprint \
    koekeishiya/formulae/skhd \
    koekeishiya/formulae/yabai

brew install --cask \
    alt-tab \
    font-jetbrains-mono-nerd-font \
    font-iosevka-mono-nerd-font \
    python@3.11 \
    wezterm-nightly

brew cleanup
