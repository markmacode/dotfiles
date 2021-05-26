#!/usr/bin/env bash

# Shortcuts
alias c='clear'

# Python
alias vc='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias pp='export PYTHONPATH=$PWD'
alias setpy39='sudo update-alternatives --set python3 /usr/bin/python3.9'
alias setpy36='sudo update-alternatives --set python3 /usr/bin/python3.6'

# Dir listing
alias lf='ls -alF'
alias ll='ls -Alp'
alias la='ls -A'
alias l='ls -CF'

# Git
alias gs='git status'
alias push='git push'
alias pull='git pull'
alias fpull='git fetch && git pull'