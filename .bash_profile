#!/usr/bin/env bash

# Colors for ls
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)";

# Sourcing
source ~/.exports
source ~/.bash_prompt
source ~/.bash_aliases
source ~/.functions
