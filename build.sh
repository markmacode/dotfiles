#!/usr/bin/env bash

source ./scripts/init-env.sh

if [[ "${DOTFILES_OS}" != "unknown" ]]; then
    echo "[+] Detected OS: ${DOTFILES_OS}"
    ./scripts/build-${DOTFILES_OS}.sh
else
    echo "[WARNING] Unkown OS environment of: $(uname -a)"
    echo "[+] Skipping any package installs / distro setups."
fi

if ! command -v zsh &> /dev/null; then
    echo "[WARNING] zsh is not installed"
    echo "https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH"
else
    ./scripts/init-zsh.sh
fi

./install.sh

echo "[+] Reset shell with: \$SHELL -l"
