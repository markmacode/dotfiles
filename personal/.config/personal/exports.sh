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
export FZF_DEFAULT_OPTS="--multi"

export NVM_DIR="$HOME/.nvm"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
