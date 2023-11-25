#!/usr/bin/env bash

if ! command -v brew &>/dev/null; then
    echo "[+] Installing Homebrew"
    NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew tap homebrew/cask-fonts

brew install \
    dprint \
    koekeishiya/formulae/skhd \
    koekeishiya/formulae/yabai

brew install --cask \
    alt-tab \
    font-jetbrains-mono-nerd-font \
    gcc-arm-embedded \
    iterm2 \
    python@3.11 \
    qmk-toolbox

brew cleanup
