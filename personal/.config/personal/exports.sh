#!/usr/bin/env bash

# PATH
export PATH="$XDG_CONFIG_HOME/personal/scripts:$PATH"
export PATH="$XDG_BIN_HOME:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/opt/postgresql@17/bin:$PATH"

# Misc exports
export EDITOR="nvim"
export PAGER="bat"

export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

export NVM_DIR="$HOME/.nvm"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
