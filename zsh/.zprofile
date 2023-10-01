source $HOME/.config/dotfiles/dotrc

if [ "$DOTFILES_OS" = "mac" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Shortcuts
alias c='clear'
alias untar='tar -xvzf'
alias untarxz='tar -xvJf'
alias dotfiles='nvim $DOTFILES'

# Python
alias py='python3'
alias vc='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
