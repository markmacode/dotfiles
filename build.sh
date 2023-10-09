#!/usr/bin/env bash

user_install=false
if [[ ! -z $1 ]]; then
    if [[ "$1" == "--user" ]]; then
        echo "[WARNING] User install does NOT work on MacOS"
        user_install=true
    else
        echo "[ERROR] Invalid argument $1"
        echo "[+] Only valid argument is --user"
        exit 1
    fi
fi

source ./scripts/os.sh
if ! command -v nix-env &> /dev/null; then
    echo "[+] Installing Nix package manager"

    if [[ "$OS" == "mac" ]]; then
        sh <(curl -L https://nixos.org/nix/install) --yes
    elif [[ "$user_install" == true ]]; then
        sh <(curl -L https://nixos.org/nix/install) --yes --no-daemon
    else
        sh <(curl -L https://nixos.org/nix/install) --yes --daemon
    fi

    echo "[+] Nix has been installed, run ./build.sh again to continue"
    exec $SHELL
fi

[[ "$OS" == "mac" ]] && ./packages/brew.sh
./packages/nix.sh
./install.sh

if ! command -v zsh &> /dev/null; then
    echo "[+] Installing zsh"
    nix-env -iA nixpkgs.zsh
fi

if [[ "$SHELL" != "/bin/zsh" ]]; then
    echo "[+] Setting ZSH as default shell"
    command -v zsh | sudo tee -a /etc/shells
    sudo chsh -s $(which zsh) $USER
fi

if [[ -z "${ZSH}" ]]; then
    echo "[+] Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
        "" --keep-zshrc --unattended
    echo "[+] Installing powerlevel10k theme for zsh"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi
exec $SHELL
