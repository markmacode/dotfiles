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
alias ls='ls --color=auto'
alias lf='ls -alF --color=auto'
alias ll='ls -Alp --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

# Grepping
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git
alias gs='git status'
alias push='git push'
alias pull='git pull'
alias fpull='git fetch && git pull'
