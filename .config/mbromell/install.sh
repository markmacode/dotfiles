#!/usr/bin/env bash

if [[ "$1" == "https" ]]; then
    git clone --bare https://github.com/mbromell/dotfiles.git $HOME/.dot
else
    git clone --bare git@github.com:mbromell/dotfiles.git $HOME/.dot
fi

# Try to checkout code, if there's existing files then back them up
# and try again
git --git-dir=$HOME/.dot/ --work-tree=$HOME checkout
if [ $? = 0 ]; then
    echo "Checked out dotfiles"
else
    echo "Backing up pre-existing dot files"
    mkdir -p home.bak-$(date +"%Y%m%d%H%M%S")
    cp -R .config home.bak-$(date +"%Y%m%d%H%M%S")/.config
    find . -maxdepth 1 -type f | xargs -I{} cp {} home.bak-$(date +"%Y%m%d%H%M%S")/
    git --git-dir=$HOME/.dot/ --work-tree=$HOME checkout -f
    echo "Checked out dotfiles"
fi

git --git-dir=$HOME/.dot/ --work-tree=$HOME config status.showUntrackedFiles no
