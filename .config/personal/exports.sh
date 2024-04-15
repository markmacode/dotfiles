[ -z "${XDG_CONFIG_HOME}" ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z "${XDG_DATA_HOME}" ] && export XDG_DATA_HOME="$HOME/.local/share"
[ -z "${XDG_BIN_HOME}" ] && export XDG_BIN_HOME="$HOME/.local/bin"
[ -z "${XDG_LIB_HOME}" ] && export XDG_LIB_HOME="$HOME/.local/lib"
[ -z "${XDG_CACHE_HOME}" ] && export XDG_CACHE_HOME="$HOME/.cache"

# Cannot use [ -z ... ] for these because they're likely set by default on
# the OS, so these exports will never be used.
export EDITOR="nvim"
export PAGER="bat"

export FZF_DEFAULT_COMMAND='fd -t file -LH -E "{\.git,node_modules}"'

