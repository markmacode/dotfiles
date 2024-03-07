#!/usr/bin/env bash

case "$(uname -a)" in
    Linux*microsoft-standard-WSL2*) export DOTFILES_OS="wsl" ;;
    Linux*) export DOTFILES_OS="linux" ;;
    Darwin*) export DOTFILES_OS="mac" ;;
    MINGW*) export DOTFILES_OS="mingw" ;;
    *) export DOTFILES_OS="unknown" ;;
esac
