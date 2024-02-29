#!/usr/bin/env bash

# Dotfiles stuff
alias dot='cd $DOTFILES'

# Package managers
if [[ "$DOTFILES_OS" == "mac" ]]; then
    alias add='add-brew'
    alias remove='remove-brew'
elif [[ "$DOTFILES_OS" == "windows" ]]; then
    alias add='add-winget'
    alias remove='remove-winget'
fi

# System shortcuts
alias t='tail -f'

# fzf stuff
# [F]uzzy find [F]ile
alias ff='fzf'
# [F]uzzy find [F]ile and [V]im
alias ffv='nvim $(fzf)'
# [F]uzzy find [D]ir and [C]ange
alias fdc='cd $(fd -t directory -LH -E "{.git,node_modules}" | fzf)'
# [F]uzzy find [D]ir and [V]im
alias fdv='nvim $(fd -t directory -LH -E "{.git,node_modules}" | fzf)'

# Python
alias py='python3'
alias pip='pip3'

# Listing files
# Using `x` because hitting `x` and enter is easier than `l` and enter :)
alias eza='eza --color=always'
alias x='eza -la --no-permissions --no-time --no-user --no-filesize --group-directories-first --git'
alias xx='eza -lah --group-directories-first --git'

# Development experience
alias v='nvim'
