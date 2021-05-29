#!/usr/bin/env bash

# Start docker
sudo service docker start &>/dev/null;

# Node stuff
export NVM_DIR="$HOME/.nvm";
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion";

test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)";

# Sourcing
source ~/.exports;
source ~/.bash_prompt;
source ~/.bash_aliases;
source ~/.functions;