# Set XDG directories
[ -z "${XDG_CONFIG_HOME}" ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z "${XDG_DATA_HOME}" ]   && export XDG_DATA_HOME="$HOME/.local/share"
[ -z "${XDG_BIN_HOME}" ]    && export XDG_BIN_HOME="$HOME/.local/bin"
[ -z "${XDG_LIB_HOME}" ]    && export XDG_LIB_HOME="$HOME/.local/lib"
[ -z "${XDG_CACHE_HOME}" ]  && export XDG_CACHE_HOME="$HOME/.cache"

# Set default applications
export EDITOR="nvim"
export PAGER="bat"

export FZF_DEFAULT_COMMAND='fd -t file -LH -E "{\.git,node_modules}"'
