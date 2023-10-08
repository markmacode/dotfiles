#!/usr/bin/env bash

nix-env -iA \
    nixpkgs.act \
    nixpkgs.curl \
    nixpkgs.git \
    nixpkgs.jq \
    nixpkgs.neovim \
    nixpkgs.parallel \
    nixpkgs.ripgrep \
    nixpkgs.rustup \
    nixpkgs.stow
