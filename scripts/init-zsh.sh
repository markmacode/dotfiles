#!/usr/bin/env bash

chsh -s $(which zsh)

if [[ -z "${ZSH}" ]]; then
    echo "[+] Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "[+] Installing powerlevel10k theme for zsh"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k
fi
