#!/usr/bin/env bash

# zsh may already be installed, do not install a second one
if ! command -v zsh &> /dev/null; then
    nix-env -iA nixpkgs.zsh
fi

nix-env -iA \
    nixpkgs.act \
    nixpkgs.bat \
    nixpkgs.curl \
    nixpkgs.eza \
    nixpkgs.fd \
    nixpkgs.fzf \
    nixpkgs.gcc \
    nixpkgs.git \
    nixpkgs.go \
    nixpkgs.jq \
    nixpkgs.neovim \
    nixpkgs.gnumake \
    nixpkgs.parallel \
    nixpkgs.ripgrep \
    nixpkgs.rustup \
    nixpkgs.stow \
    nixpkgs.xplr

