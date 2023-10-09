#!/usr/bin/env bash

nix-env -iA \
    nixpkgs.act \
    nixpkgs.bat \
    nixpkgs.curl \
    nixpkgs.gcc \
    nixpkgs.git \
    nixpkgs.jq \
    nixpkgs.neovim \
    nixpkgs.parallel \
    nixpkgs.ripgrep \
    nixpkgs.rustup \
    nixpkgs.stow
