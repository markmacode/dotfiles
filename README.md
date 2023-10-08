These dotfiles are a little bit more complex then just stowing files to
`$HOME`. I believe simple is better but sadly my development environments
are fragmented. I use MacOS as my personal development environment, Windows
for work with WSL, and I frequently have SSH into machines running various
different operating systems.

There's 2 things I want to do with my dotfiles:

1. Keep track of my config files for various applications
2. Allow myself to easily setup any OS to a state that I want it in.

But I also want to be able to easily setup any machine that I will temporarily
access (through SSH usually) without installing a bunch of dependencies and
polluting the home dir with config files for apps not even on the machine.

# Build

The 'Build' will setup a fresh OS and may install packages listed inside of
[packages/](./packages). If it is an OS with no specific build script inside
[scripts/build-*.sh](./scripts) or a stow list inside [stow/](./stow), then the
basic build will be performed, oterwise a full build will be done. After the
build is done, the [`install.sh`](./install.sh) script will be run
automatically, so you don't have to do a build and then an install.

First off you will need to clone the repo and `cd` into it.

```bash
git clone https://github.com/mbromell/dotfiles.git
cd dotfiles
```

## Full Build

```bash
./build.sh
```

## Basic Build

```bash
./build.sh --basic
```

# Install

Clone the repo and `cd` into it.

```bash
git clone https://github.com/mbromell/dotfiles.git
cd dotfiles
```

## Full Install

```bash
./install.sh
```

## Basic Install

```bash
./install.sh --basic
```

# Commands

For convenience, there are a few commands that these dotfiles set up for you
to run anywhere at any time inside your shell. These are currently just aliases
setup inside [alias.sh](./home/mbromell/.config/mbromell/alias.sh)

1. `dotfiles` Open up dotfiles in NeoVim for editing.
2. `dotpull` Pull the latest changes of the current checked out branch of your
    dotfiles.
3. `dotstow` Runs `./install.sh` script for quick stowing at any time
4. `dot` Runs `dotpull && dotstow` for quick syncing of any changes.
