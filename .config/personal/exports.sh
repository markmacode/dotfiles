#!/usr/bin/env bash

# PATH
export PATH="$XDG_CONFIG_HOME/personal/scripts:$PATH"
export PATH="$XDG_BIN_HOME:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Misc exports
export EDITOR="nvim"
export PAGER="bat"

export FZF_DEFAULT_COMMAND='fd -t file -LH -E "{\.git,node_modules}"'
export FZF_DEFAULT_OPTS=" \
--color=bg+:#3c3836,bg:#32302f,spinner:#8ec07c,hl:#83a598 \
--color=fg:#bdae93,header:#83a598,info:#fabd2f,pointer:#8ec07c \
--color=marker:#8ec07c,fg+:#ebdbb2,prompt:#fabd2f,hl+:#838ba8"

export NVM_DIR="$HOME/.nvm"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
