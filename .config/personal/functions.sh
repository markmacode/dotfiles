#!/usr/bin/env bash

# This is for the bare repo managmene of dotfiels
# https://www.atlassian.com/git/tutorials/dotfiles
#
# Treat this function like the `git` command, except it will only interact with
# the dotfiles repo, no matter where you are on the terminal.
#
# usage: dot [git-args] [lazy]
#
#   git-args    any standard git arguments you want
#   lazy        open `lazygit` with the dotilfes repo worktree
#
function dot {
    if [ "$1" = "add" ] && [ "$2" = "-a" ]; then
        set -- "$1" "--all" "${@:3}"
    elif [ "$1" = "add" ] && [ "$2" = "." ]; then
        set -- "$1" "--all" "${@:3}"
    elif [ "$1" = "a" ]; then
        set -- "add" "--all" "${@:3}"
    fi

    if [ "$1" = "add" ] && [ "$2" = "--all" ]; then
        cat $HOME/.gitinclude | xargs -I % \
            git --git-dir=$HOME/.dot/ --work-tree=$HOME add ${HOME}/%
    elif [ "$1" = "lazy" ]; then
        lazygit -g $HOME/.dot -w $HOME ${@:2}
    else
        git --git-dir=$HOME/.dot/ --work-tree=$HOME $@
    fi
}

# Run yazi through `yy` and when you close it it will cd into the selected 
# directory on yazi
function yy {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
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

