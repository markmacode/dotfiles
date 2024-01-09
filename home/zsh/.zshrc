export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    git
    docker
    dotenv
    gitignore
    nvm
    pep8
    rust
    zsh-autosuggestions
    fast-syntax-highlighting
    zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh
source $XDG_CONFIG_HOME/mbromell/env.sh
source $XDG_CONFIG_HOME/mbromell/alias.sh
if [[ -e "$XDG_CONFIG_HOME/work/setup.sh" ]]; then
    source "$XDG_CONFIG_HOME/work/setup.sh"
fi

# Append Cargo to path, if it's installed
if [[ -d "$HOME/.cargo/bin" ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Starship prompt
eval "$(starship init zsh)"

if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # QMK stuff
    export PATH="/opt/homebrew/opt/avr-gcc@8/bin:$PATH"
    export LDFLAGS="-L/opt/homebrew/opt/avr-gcc@8/lib"
fi
