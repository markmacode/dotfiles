# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode reminder
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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
source $HOME/.config/dotfiles/functions.sh

# Hiding dirs / files from showing in fzf
export FZF_DEFAULT_COMMAND="rg --files --follow --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Cargo binaries
export PATH="$HOME/.cargo/bin:$PATH"

# QMK stuff
export PATH="/opt/homebrew/opt/avr-gcc@8/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/avr-gcc@8/lib"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
