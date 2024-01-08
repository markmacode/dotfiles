# Dotfiles stuff
alias dot='cd $DOTFILES'
function dotpull() {
    pushd $DOTFILES
    git pull
    ./install.sh
    popd
}
function dotsync() {
    pushd $DOTFILES
    git pull
    git add .
    git commit -m "Sync ($(uname -nmsr))"
    git push
    ./install.sh
    popd
}

# System shortcuts
alias L='$SHELL -l'
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
function pyv() {
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

# Listing files
# Using `x` because hitting `x` and enter is easier than `l` and enter :)
alias eza='eza --color=always'
alias x='eza -la --no-permissions --no-time --no-user --no-filesize --group-directories-first --git'
alias xx='eza -lah --group-directories-first --git'

# Development experience
alias v='nvim .'
alias z='zellij'
