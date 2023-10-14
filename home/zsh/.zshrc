export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    docker
    dotenv
    gitignore
    nvm
    pep8
    rust
)

source $ZSH/oh-my-zsh.sh
source $XDG_CONFIG_HOME/mbromell/env.sh
source $XDG_CONFIG_HOME/mbromell/alias.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Append Cargo to path, if it's installed
if [[ -d "$HOME/.cargo/bin" ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # QMK stuff
    export PATH="/opt/homebrew/opt/avr-gcc@8/bin:$PATH"
    export LDFLAGS="-L/opt/homebrew/opt/avr-gcc@8/lib"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
