# mbromell dotfiles

![Screenshot of MacOS using dotfiles](images/screenshot-01.png)

*[Wallpaper](https://unsplash.com/photos/low-angle-photography-of-trees-during-night-time-_OQ8Jc7kBmA)
by [Jr Korpa](https://unsplash.com/@jrkorpa)*

## Install

This step requires `stow` (GNU Stow) and it does symlinking of dotfiles found in
this repos [`home/`](home/) directory to the user's `$HOME` directory.

```bash
./install.sh
```

## Build (optional)

**Read and understand this script before using it, and then use it at your own
risk!**

```bash
./build.sh
```

This script will setup the OS with various package managers, packages, and the
zsh shell. It might be something you like, but it does things that are personal
preference rather than standard practice. If you are unsure about it, do not use
it.

## Extras

### Extending with `.zprofile`

You may have noticed that there is no `.zprofile` in my dotfiles. You can put a
custom configuration for zsh inside the `~/.zprofile` file on each system that
uses these dotfiles.

### Commands

For convenience, there are a few commands that these dotfiles set up for you to
run anywhere at any time inside your shell. These are currently just aliases
setup inside [alias.sh](./home/mbromell/.config/mbromell/alias.sh).

1. `dotfiles` Change directory to the dotfiles repo.
2. `dotpull` Pull the latest changes of the current checked out branch of your
   dotfiles.
3. `dotstow` Just runs `./install.sh` script
4. `dot` Runs `dotpull && dotstow` for quick syncing of any changes.

If you are not using `zsh` and you still want these aliases, then add the
following lines inside one of your own shell setup files.

```bash
source $HOME/.config/mbromell/env.sh
source $HOME/.config/mbromell/alias.sh
```

## File Structure

### [`home/`](home/)

This directory will store the configuration files that are going to be put
inside of the current user `$HOME` directory. It will do this using
[GNU stow](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

### [`packages/`](packages/)

Scripts for installing packages. Each file should only install packages related
to certain package manager. The name of the file is the package manager's name.

### [`scripts/`](scripts/)

Arbitrary scripts to be executed by the user in the terminal, or scripts that
are used inside other scripts.
