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

if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source $HOME/.commonrc
