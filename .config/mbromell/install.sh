#!/usr/bin/env bash

if [[ "$1" == "https" ]]; then
    git clone --bare https://github.com/mbromell/dotfiles.git $HOME/.dot
else
    git clone --bare git@github.com:mbromell/dotfiles.git $HOME/.dot
fi

# Try to checkout code, if there's existing files then back them up
# and try again
mkdir -p .config-backup
git --git-dir=$HOME/.dot/ --work-tree=$HOME checkout
if [ $? = 0 ]; then
    echo "Checked out config";
else
    echo "Backing up pre-existing dot files";
    git --git-dir=$HOME/.dot/ --work-tree=$HOME checkout 2>&1 \
        | tail -n +2 \
        | head -n -2 \
        | awk {'print $1'} \
        | xargs -I{} sh -c 'mkdir -p .config-backup/{}; mv {} .config-backup/{}'
fi

git --git-dir=$HOME/.dot/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dot/ --work-tree=$HOME config status.showUntrackedFiles no
