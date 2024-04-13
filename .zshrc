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

# Inject before because you might want to overwrite XDG dirs before
# exports that use those dirs inside .zshrc.exports
# Then inject after because you might want to override vars such as
# EDITOR and PAGER
# Doing this double source should not have adverse side effects.. maybe
source "$HOME/.zshrc.inject"
source "$HOME/.zshrc.exports"
source "$HOME/.zshrc.inject"

if [[ -e "$XDG_CONFIG_HOME/mbromell/setup.sh" ]]; then
    source "$XDG_CONFIG_HOME/mbromell/setup.sh"
fi
if [[ -e "$XDG_CONFIG_HOME/work/setup.sh" ]]; then
    source "$XDG_CONFIG_HOME/work/setup.sh"
fi

if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# ZSH Completions
[ -s "$ZSH/completions/_bun" ] && source "$ZSH/completions/_bun"
