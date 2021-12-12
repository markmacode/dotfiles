#!/usr/bin/env bash

# Shortcuts
alias c='clear'
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias untar='tar -xvzf'
alias untarxz='tar -xvJf'

# Python
alias vc='python -m venv ./venv'
alias pp='export PYTHONPATH=$PWD'

if is_linux; then
    alias va='source ./venv/bin/activate'
    alias setpy39='sudo update-alternatives --set python /usr/bin/python3.9'
    alias setpy38='sudo update-alternatives --set python /usr/bin/python3.8'
    alias setpy37='sudo update-alternatives --set python /usr/bin/python3.7'
    alias setpy36='sudo update-alternatives --set python /usr/bin/python3.6'
elif is_msys; then
    alias va='source ./venv/Scripts/activate'
fi

# Dir listing
alias ls="ls --color=auto -I '\$RECYCLE.BIN' -I 'System Volume Information'"
alias lf="ls -alF --color=auto -I '\$RECYCLE.BIN' -I 'System Volume Information'"
alias ll="ls -Alp --color=auto -I '\$RECYCLE.BIN' -I 'System Volume Information'"
alias la="ls -A --color=auto -I '\$RECYCLE.BIN' -I 'System Volume Information'"
alias l="ls -CF --color=auto -I '\$RECYCLE.BIN' -I 'System Volume Information'"

# Grepping
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
