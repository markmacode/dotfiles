#!/usr/bin/env bash

# PATH
export PATH="$XDG_CONFIG_HOME/personal/scripts:$PATH"
export PATH="$HOME/bin:$PATH"

# Misc exports
export EDITOR="nvim"
export PAGER="bat"

export FZF_DEFAULT_COMMAND='fd -t file -LH -E "{\.git,node_modules}"'
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export BAT_THEME="catppuccin-mocha"
export NVM_DIR="$HOME/.nvm"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
