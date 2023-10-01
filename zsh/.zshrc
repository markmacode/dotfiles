export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode reminder
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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

source $ZSH/oh-my-zsh.sh

# Cargo binaries
export PATH="$HOME/.cargo/bin:$PATH"

# QMK related binaries
export PATH="/opt/homebrew/opt/avr-gcc@8/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/avr-gcc@8/lib"
export PATH=$PATH:/Users/mark/.spicetify
