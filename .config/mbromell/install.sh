#!/usr/bin/env bash

if [[ "$1" == "https" ]]; then
    git clone --bare https://github.com/mbromell/dotfiles.git $HOME/.dot
else
    git clone --bare git@github.com:mbromell/dotfiles.git $HOME/.dot
fi
function dot {
    git --git-dir=$HOME/.dot/ --work-tree=$HOME $@
}
mkdir -p .config-backup
if [ $? = 0 ]; then
    echo "Checked out config.";
else
    echo "Backing up pre-existing dot files.";
    dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi
dot checkout
dot config status.showUntrackedFiles no
