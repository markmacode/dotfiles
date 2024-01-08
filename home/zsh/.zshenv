# Set XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_LIB_HOME="$HOME/.local/lib"
export XDG_CACHE_HOME="$HOME/.cache"

# Set default applications
export EDITOR="nvim"
export PAGER="bat"

export FZF_DEFAULT_COMMAND='fd -t file -LH -E "{\.git,node_modules}"'
