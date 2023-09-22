#!/usr/bin/env bash

# Sourcing
source ~/.exports
source ~/.bash_prompt
source ~/.bash_aliases
source ~/.functions

# Inject machine specific things.
# 
# This allows for safe sourcing of bootstrap.sh without overriding
# custom injected initialization stuff.
source ~/.inject 2> /dev/null
