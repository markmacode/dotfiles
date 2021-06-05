#!/usr/bin/env bash

# Start some common services
sudo service docker start &>/dev/null
sudo service postgresql start &>/dev/null

# Sourcing
source ~/.exports
source ~/.bash_prompt
source ~/.bash_aliases
source ~/.functions
