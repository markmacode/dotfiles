#!/usr/bin/env bash

if ! command -v cargo &> /dev/null; then
    echo "[+] Command 'cargo' is not installed"
    echo "[+] Installing Rust using https://sh.rustup.rs"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

cargo install --locked \
    bliss \
    starship \
    zellij

