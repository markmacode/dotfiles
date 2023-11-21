#!/usr/bin/env bash

case "$(uname -a)" in
    Linux*microsoft-standard-WSL2*) export OS="wsl" ;;
    Linux*) export OS="linux" ;;
    Darwin*) export OS="mac" ;;
    *) export OS="unknown" ;;
esac

if ! command -v nix-env &> /dev/null; then
    echo "[E] Nix is not installed"
    echo "    To install at a system level run \`./setup/nix-root.sh\`"
    echo "    To install at a user level run \`./setup/nix-user.sh\`"
    exit 1
fi

./packages/nix.sh
./packages/cargo.sh
[[ "$OS" == "mac" ]] && ./packages/brew.sh

./install.sh

./setup/zsh.sh
./setup/nvim.sh

exec $SHELL

