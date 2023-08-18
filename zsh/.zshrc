# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode reminder
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Plugins
plugins=(
    git
    docker
    dotenv
    gitignore
    macos
    nvm
    pep8
    rust
)

# Applying oh-my-zsh config
source $ZSH/oh-my-zsh.sh

