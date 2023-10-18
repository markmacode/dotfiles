# Dotfiles stuff
alias dotfiles='pushd $DOTFILES ; ${=EDITOR} ${DOTFILES} ; popd'
alias dotpull='pushd $DOTFILES ; git pull ; popd'
alias dotstow='pushd $DOTFILES ; ./install.sh ; popd'
alias dot='pushd $DOTFILES ; git pull ; ./install.sh ; popd'

# System shortcuts
alias L='$SHELL -l'
alias c='cd'
alias t='tail -f'

alias grep='grep --color'
alias grepi='grep -i'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias ff='find . -type f -name'
alias fd='find . -type d -name'
alias fp='find . -path'

# Python
alias py='python3'
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
alias eza='eza --color=always'
alias x='eza -la --no-permissions --no-time --no-user --no-filesize --group-directories-first --git'
alias xx='eza -lah --group-directories-first --git'
alias xxx='eza -la -o --no-permissions --group-directories-first --git --git-ignore -T | bat --style=plain'

