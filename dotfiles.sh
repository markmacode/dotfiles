#!/usr/bin/env bash

echo "[+] Installing Nix packages"
if ! command -v nix &>/dev/null; then
    echo "[WARNING] Nix is not installed, attempting to install nix"
    sh <(curl -L https://nixos.org/nix/install) --daemon
    echo "[WARNING] Nix installed, re-run this script"
    exit 0
else
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
    nix-channel --update
    nix-env -if "$HOME/dotfiles.nix"
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
fi

declare -a custom_plugins=(
    "zdharma-continuum/fast-syntax-highlighting"
    "zsh-users/zsh-autosuggestions"
    "marlonrichert/zsh-autocomplete"
)
pushd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins
for repo in "${custom_plugins[@]}"; do
    git clone https://github.com/${repo}.git
done

nvim --headless "+Lazy! restore" +qa

echo "[+] Restart terminal for changes to take effect"
