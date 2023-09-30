source $HOME/.config/dotfiles/env

if [ "$DOTFILES_OS" = "mac" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

function dotsync() {
    pushd $DOTFILES
    echo "[+] Pulling latest changes"
    git pull
    echo "[+] Syncing dotfiles"
    ./sync.sh
    popd
}

function dotpush() {
    pushd $DOTFILES
    echo "[+] Creating generic commit"
    git add --all
    git commit -m "Update from dotpush()"
    git push
    popd
}

# Shortcuts
alias c='clear'
alias untar='tar -xvzf'
alias untarxz='tar -xvJf'
alias dotfiles='nvim $DOTFILES'

# Python
alias py='python3'
alias vc='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
