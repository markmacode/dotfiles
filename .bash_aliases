#!/usr/bin/env bash

# Shortcuts
alias c='clear'
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias untar='tar -xvzf'

# Python
alias vc='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias pp='export PYTHONPATH=$PWD'
alias setpy39='sudo update-alternatives --set python /usr/bin/python3.9'
alias setpy38='sudo update-alternatives --set python /usr/bin/python3.8'
alias setpy37='sudo update-alternatives --set python /usr/bin/python3.7'
alias setpy36='sudo update-alternatives --set python /usr/bin/python3.6'

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

# Git
alias gs='git status'
alias ga='git add .'
alias amend='git commit --amend --no-edit'
alias push='git push'
alias pull='git pull'
alias fpull='git fetch && git pull'
