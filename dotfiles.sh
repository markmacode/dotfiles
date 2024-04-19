#!/usr/bin/env bash

echo "[+] Installing Nix packages"
if ! command -v nix &>/dev/null; then
    echo "[WARNING] Nix is not installed, attempting to install nix"
    sh <(curl -L https://nixos.org/nix/install) --daemon
    echo "[WARNING] Nix installed, re-run this script"
    exit 0
else
    stable_version="23.11"
    if [ "$(uname)" == "Darwin" ]; then
        nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
        nix-channel --add https://nixos.org/channels/nixpkgs-${stable_version}-darwin stable
    else
        nix-channel --add https://nixos.org/channels/nixos-unstable unstable
        nix-channel --add https://nixos.org/channels/nixos-${stable_version} stable
    fi
    nix-channel --update
    nix-env -if "$HOME/dotfiles.nix"
fi

if [[ "$SHELL" != "$(which zsh)" ]]; then
    echo "[+] Setting ZSH as default shell"
    command -v zsh | sudo tee -a /etc/shells
    sudo chsh -s $(which zsh) $USER
fi

if [[ -z "${ZSH}" ]]; then
    echo "[+] Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
        "" --keep-zshrc --unattended
fi

declare -a custom_plugins=(
    "zdharma-continuum/fast-syntax-highlighting"
    "zsh-users/zsh-autosuggestions"
    "marlonrichert/zsh-autocomplete"
)
for repo in "${custom_plugins[@]}"; do
    plugins_path="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"
    repo_path="${plugins_path}/${repo#*/}"
    # Get repo name after slash because that is what the dir name is
    # If it is already there, then update it
    if [ -d "$repo_path" ]; then
        echo "[+] Updating ZSH plugin $repo"
        git -C "$repo_path" pull
    else
        echo "[+] Downloading ZSH plugin $repo"
        git clone https://github.com/${repo}.git "$plugins_path"
    fi
done

# Install neovim for WSL.
# Going the nixpkgs route causes strange issues with the gcc compiler and libstdc++.so.6
if [[ $(grep -i "microsoft" /proc/version) ]]; then
    echo "[+] Installing neovim from pre-built binaries"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo rm -rf /opt/nvim-linux64
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    rm nvim-linux64.tar.gz
    export PATH="/opt/nvim-linux64/bin:$PATH"
fi

echo "[+] Setting lazy.nvim plugins to the lockfile versions"
nvim --headless "+Lazy! restore" +qa

echo "[+] Restart terminal for changes to take effect"
