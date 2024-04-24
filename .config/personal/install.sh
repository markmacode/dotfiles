#!/usr/bin/env bash

if [[ "$1" == "https" ]]; then
    git clone --bare https://github.com/mbromell/dotfiles.git $HOME/.dot
else
    git clone --bare git@github.com:mbromell/dotfiles.git $HOME/.dot
fi

function my_reverse {
    if [ "$(uname)" = "Darwin" ]; then
        tail -r
    else
        tac
    fi
}

# Try to checkout code, if there's existing files then back them up
# and try again
git --git-dir=$HOME/.dot/ --work-tree=$HOME checkout
if [ $? = 0 ]; then
    echo "Checked out dotfiles"
else
    backup_name=home-$(date +"%Y%m%d%H%M%S").bak
    echo "Backing up pre-existing dot files to $backup_name"
    mkdir -p $backup_name

    # Get the conflicting files to pipe them into the backup subscript
    # The subscript will end up looking something like this:
    #   mkdir -p home-x.bak/parent/file.txt; mv parent/file.txt home-x.bak/parent/file.txt
    git --git-dir=$HOME/.dot/ --work-tree=$HOME checkout 2>&1 \
        | tail -n +2 | my_reverse | tail -n +3 \
        | awk {'print $1'} \
        | xargs -I{} sh -c 'mkdir -p $1/$(dirname {}); mv {} $1/{}' _ $backup_name
    echo "Backed up conflicts to $backup_name"
fi

git --git-dir=$HOME/.dot/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dot/ --work-tree=$HOME config status.showUntrackedFiles no
echo "Checked out dotfiles"
