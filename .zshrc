export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
    git
    docker
    dotenv
    gitignore
    nvm
    pep8
    zsh-autosuggestions
    zsh-autocomplete
)
source "$ZSH/oh-my-zsh.sh"
[ -s "$HOME/.zshrc.inject" ] && source "$HOME/.zshrc.inject"


#-------------------------------------------------------------------------------
# XDG exports if not already set
#-------------------------------------------------------------------------------
[ -z "${XDG_CONFIG_HOME}" ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z "${XDG_DATA_HOME}" ] && export XDG_DATA_HOME="$HOME/.local/share"
[ -z "${XDG_BIN_HOME}" ] && export XDG_BIN_HOME="$HOME/.local/bin"
[ -z "${XDG_LIB_HOME}" ] && export XDG_LIB_HOME="$HOME/.local/lib"
[ -z "${XDG_CACHE_HOME}" ] && export XDG_CACHE_HOME="$HOME/.cache"


#-------------------------------------------------------------------------------
# Misc exports
#-------------------------------------------------------------------------------
export EDITOR="nvim"
export PAGER="bat"
export FZF_DEFAULT_COMMAND='fd -t file -LH -E "{\.git,node_modules}"'
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export BAT_THEME="catppuccin-mocha"
export NVM_DIR="$HOME/.nvm"


#-------------------------------------------------------------------------------
# $PATH updating
#-------------------------------------------------------------------------------
export PATH="$XDG_CONFIG_HOME/personal/scripts:$PATH"


#-------------------------------------------------------------------------------
# Extra setup scripts
#-------------------------------------------------------------------------------
[ -s "$XDG_CONFIG_HOME/personal/setup.sh" ] && source "$XDG_CONFIG_HOME/personal/setup.sh"
[ -s "$XDG_CONFIG_HOME/work/setup.sh" ] && source "$XDG_CONFIG_HOME/work/setup.sh"


#-------------------------------------------------------------------------------
# Evals / init programs for shell
#-------------------------------------------------------------------------------
[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -f /home/linuxbrew/.linuxbrew/bin/brew ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


#-------------------------------------------------------------------------------
# Shell completions
#-------------------------------------------------------------------------------
[ -s "$ZSH/completions/_bun" ] && source "$ZSH/completions/_bun"
[ -s "$HOME/.cargo/env" ] && source "$HOME/.cargo/env" 
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"


[ -s "$HOME/.zshrc.inject" ] && source "$HOME/.zshrc.inject"
