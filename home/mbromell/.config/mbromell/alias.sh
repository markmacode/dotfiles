# Dotfiles stuff
alias dotfiles='${=EDITOR} ${DOTFILES}'
alias dotpull='pushd $DOTFILES ; git pull ; popd'
alias dotstow='pushd $DOTFILES ; ./install.sh ; popd'
alias dot='pushd $DOTFILES ; git pull ; ./install.sh ; popd'

# System shortcuts
alias L='$SHELL -l'

# Python
alias py='python3'
alias pyv='python3 -m venv ./venv'
alias pyva='source ./venv/bin/activate'

# Listing files
alias eza='eza --color=always'
alias x='eza -la --no-permissions --no-time --no-user --no-filesize --group-directories-first --git'
alias xx='eza -lah --group-directories-first --git'
alias xxx='eza -la -o --no-permissions --group-directories-first --git --git-ignore -T | bat --style=plain'

# Changing files
alias c='cd'

alias grep='grep --color'
alias grepi='grep -i'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'
