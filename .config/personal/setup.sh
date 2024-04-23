#!/usr/bin/env bash

[ -z "${XDG_CONFIG_HOME}" ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z "${XDG_DATA_HOME}" ] && export XDG_DATA_HOME="$HOME/.local/share"
[ -z "${XDG_BIN_HOME}" ] && export XDG_BIN_HOME="$HOME/.local/bin"
[ -z "${XDG_LIB_HOME}" ] && export XDG_LIB_HOME="$HOME/.local/lib"
[ -z "${XDG_CACHE_HOME}" ] && export XDG_CACHE_HOME="$HOME/.cache"

# Cannot use [ -z ... ] for these because they're likely set by default on
# the OS, so these exports will never be used.
export EDITOR="nvim"
export PAGER="bat"
export FZF_DEFAULT_COMMAND='fd -t file -LH -E "{\.git,node_modules}"'

export PATH="$XDG_CONFIG_HOME/personal/scripts:$PATH"
[ -d /opt/nvim-linux64/bin ] && export PATH="/opt/nvim-linux64/bin:$PATH"

# This is for the bare repo managmene of dotfiels
# https://www.atlassian.com/git/tutorials/dotfiles
function dot {
    git --git-dir=$HOME/.dot/ --work-tree=$HOME $@
}
function dotadd {
    cat $HOME/.gitinclude | xargs -I % git --git-dir=$HOME/.dot/ --work-tree=$HOME add %
}

# This function is context aware, just run `pyv` to create, activate, and 
# deactivate your virtual env
# pyv [venv_dir]
function pyv {
    local venv_dir="${1:-.venv}"
    if [[ ! -d $venv_dir ]]; then
        # Create the virtual environment dir if it is not there.
        python3 -m venv $venv_dir
    fi
    if [[ -z $VIRTUAL_ENV ]]; then
        # Activate the venv dir if one is not active.
        source $venv_dir/bin/activate
        return 0
    fi
    if [[ ! -z $VIRTUAL_ENV ]] && [[ ! -z $1 ]]; then
        # Virtual env is active but an arg is specified, switch environments.
        deactivate
        source $venv_dir/bin/activate
        return 0
    fi
    # No arg specified and virtual environment is active, so deactivate.
    deactivate
    return 0
}

alias t='tail -f'
alias g='git'

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
alias python='python3'
alias pip='pip3'

# Listing files
alias eza='eza --color=always'
alias l='eza -lah --group-directories-first --git'

bindkey -s ^f "tmux-sessionizer\n"
