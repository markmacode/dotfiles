# Dotfiles stuff
alias dotfiles='${=EDITOR} ${DOTFILES}'
alias dotpull='pushd $DOTFILES && git pull && popd'
alias dotstow='pushd $DOTFILES && ./install.sh && popd'
alias dot='pushd $DOTFILES; git pull; ./install.sh && popd'

# System shortcuts
alias c='clear'

# Python
alias py='python3'
alias vc='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'

# Ripped from oh-my-zsh
# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
alias lsr='ls -lARFh' #Recursive list of files and directories
alias lsn='ls -1'     #A column contains name of files and directories

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'
