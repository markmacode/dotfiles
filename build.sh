#!/usr/bin/env bash

case "$(uname -a)" in
    Linux*microsoft-standard-WSL2*) export DOTFILES_OS="wsl" ;;
    Linux*) export DOTFILES_OS="linux" ;;
    Darwin*) export DOTFILES_OS="mac" ;;
    MINGW*) export DOTFILES_OS="windows" ;;
    *) export DOTFILES_OS="unknown" ;;
esac

if [[ "$DOTFILES_OS" == "windows" ]]; then
    echo "[+] Nothing to do on Windows MINGW"
    exit 0
fi

if ! command -v nix-env &>/dev/null; then
    echo "[E] nix-env is not installed"
    echo "  > To install at a system level run \`./scripts/setup-nix-root.sh\`"
    echo "  > To install at a user level run \`./scripts/setup-nix-user.sh\`"
    echo "  > Or go to https://nixos.org/download and do it manually"
    exit 1
fi

./packages/nix.sh
./packages/cargo.sh
[[ "$DOTFILES_OS" == "mac" ]] && ./packages/brew.sh
./packages/pip.sh

./install.sh
./scripts/setup-zsh.sh

exec $SHELL
