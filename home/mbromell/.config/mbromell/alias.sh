# Dotfiles stuff
alias dotfiles='${=EDITOR} ${DOTFILES}'
alias dotpull='pushd $DOTFILES ; git pull ; popd'
alias dotstow='pushd $DOTFILES ; ./install.sh ; popd'
alias dot='pushd $DOTFILES ; git pull ; ./install.sh ; popd'

# System shortcuts
alias c='clear'
alias L='$SHELL -l'

# Python
alias py='python3'
alias vc='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'

alias eza='eza --color=always'
alias l='eza -la --no-permissions --no-time --no-user --no-filesize \
    --group-directories-first --git'
alias la='eza -lah --group-directories-first --git'
alias lt='eza -lah --git --sort modified'
alias lr='eza -la -o --no-permissions --group-directories-first --git \
    --git-ignore -T | bat'

alias grep='grep --color'
alias grepi='grep -i'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'
