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
[ -s "$HOME/.zshrc.inject" ] && source "$HOME/.zshrc.inject"

# Setups for extra configs specific to their categories
source "${XDG_CONFIG_HOME:-$HOME/.config}/personal/setup.sh"
[ -s "$XDG_CONFIG_HOME/work/setup.sh" ] && source "$XDG_CONFIG_HOME/work/setup.sh"

[ -s "$HOME/.zshrc.inject" ] && source "$HOME/.zshrc.inject"

# Evals for varias programs
[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# ZSH Completions
[ -s "$ZSH/completions/_bun" ] && source "$ZSH/completions/_bun"
