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
    nix-env -if "./packages/stable.nix"
    nix-env -if "./packages/unstable.nix"
fi

./install.sh

echo "[+] Restart terminal for changes to take effect"
