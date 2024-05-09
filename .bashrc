# This file is mainly for the mingw64 config on Windows.
# I do not want to heavily support a mingw64 dev environment
# so this file wont be well documented or organised.
# Mingw will basically only be used to install the dotfiles
# so that I can get the config for cross-platform apps.

PROMPT_COMMAND='history -a'

# XDG exports if not already set
[ -z "${XDG_CONFIG_HOME}" ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z "${XDG_DATA_HOME}" ] && export XDG_DATA_HOME="$HOME/.local/share"
[ -z "${XDG_BIN_HOME}" ] && export XDG_BIN_HOME="$HOME/.local/bin"
[ -z "${XDG_LIB_HOME}" ] && export XDG_LIB_HOME="$HOME/.local/lib"
[ -z "${XDG_CACHE_HOME}" ] && export XDG_CACHE_HOME="$HOME/.cache"

[ -s "$XDG_CONFIG_HOME/personal/setup.sh" ] && source "$XDG_CONFIG_HOME/personal/setup.sh"
[ -s "$XDG_CONFIG_HOME/work/setup.sh" ] && source "$XDG_CONFIG_HOME/work/setup.sh"

[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -f /home/linuxbrew/.linuxbrew/bin/brew ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
