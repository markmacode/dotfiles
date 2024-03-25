#!/usr/bin/env bash

function dotpull {
    pushd $DOTFILES
    git pull
    ./install.sh
    popd
}

function dotsync {
    pushd $DOTFILES
    git pull
    git add .
    git commit -m "Sync ($(uname -nmsr))"
    git push
    ./install.sh
    popd
}

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

# brew
function add-brew {
    python $DOTFILES/scripts/listsync.py --add ${@:1} --file "$DOTFILES/packages/brew.txt"
    brew install ${@:1}
}
function remove-brew {
    python $DOTFILES/scripts/listsync.py --delete ${@:1} --file "$DOTFILES/packages/brew.txt"
    brew uninstall ${@:1}
}

# brew --cask
function add-cask {
    python $DOTFILES/scripts/listsync.py --add ${@:1} --file "$DOTFILES/packages/cask.txt"
    brew install --cask ${@:1}
}
function remove-cask {
    python $DOTFILES/scripts/listsync.py --delete ${@:1} --file "$DOTFILES/packages/cask.txt"
    brew uninstall --cask ${@:1}
}

# winget
function add-winget {
    python $DOTFILES/scripts/listsync.py --add $1 --file "$DOTFILES/packages/winget.txt"
    for package in ${@:1}; do
        winget install $package
    done
}
function remove-winget {
    python $DOTFILES/scripts/listsync.py --delete $1 --file "$DOTFILES/packages/winget.txt"
    for package in ${@:1}; do
        winget uninstall $package
    done
}
