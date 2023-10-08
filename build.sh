#!/usr/bin/env bash

${1:="--full"}

if [[ "$1" != "--full" ]] || [[ "$1" != "--basic" ]]; then
    echo "[ERROR] '$1' is invalid"
    echo "[+] You can use './build.sh --basic' for a basic install"
    echo "[+] Just use './build.sh' for a full install on supported OS's"
    exit 1
fi

source ./scripts/init-env.sh $1

if [[ "$DOTFILES_OS" != "basic" ]]; then
    echo "[+] Detected OS: $DOTFILES_OS"
    ./scripts/build-${DOTFILES_OS}.sh
else
    echo "[+] OS Not supported, or the '--basic' flag has been set."
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

./install.sh $1

echo "[+] Reset shell to complete isntallation"
