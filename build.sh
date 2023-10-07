#!/usr/bin/env bash

if [[ ! -f $HOME/.config/mbromell/env.sh ]]; then
    source ./scripts/init-env.sh
else
    source $HOME/.config/mbromell/env.sh
fi

if [[ "$DOTFILES_OS" != "unknown" ]]; then
    echo "[+] Detected OS: $DOTFILES_OS"
    ./scripts/build-${DOTFILES_OS}.sh
else
    echo "[WARNING] Unkown OS environment of: $(uname -a)"
    echo "[+] Skipping any package installs / distro setups."
fi

if ! command -v zsh &> /dev/null; then
    # ZSH ain't installed
    echo "[WARNING] zsh is not installed, install it and run ./build.sh again"
    echo "https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH"
else
    # Make ZSH default shell and install oh-my-zsh
    chsh -s $(which zsh)
    if [[ -z "$ZSH" ]]; then
        echo "[+] Installing oh-my-zsh"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo "[+] Installing powerlevel10k theme for zsh"
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
            $HOME/.oh-my-zsh/custom/themes/powerlevel10k
    fi
fi

./install.sh

echo "[+] Reset shell with: \$SHELL -l"
