#!/usr/bin/env bash

./scripts/init-env.sh

if [[ "${DOTFILES_OS}" == "unknown" ]]; then
    echo "[ERROR] Unkown OS environment of: $(uname -a)"
    echo "[+] Exiting build script."
    exit 1
else
    echo "[+] Detected OS: ${DOTFILES_OS}"
fi

./scripts/build-${DOTFILES_OS}.sh
./install.sh

echo "[+] Reset shell with: \$SHELL -l"
