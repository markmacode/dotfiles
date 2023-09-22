#!/usr/bin/env bash

# Bootstrap shell script inspired by @mathiasbynens 'dotfiles' repo on github.

git pull origin main;

function do_it {
	rsync --exclude ".git/" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	do_it;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		do_it;
	fi;
fi;

unset do_it;
