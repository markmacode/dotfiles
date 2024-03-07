# mbromell dotfiles

![Screenshot 1 of MacOS using dotfiles](images/screenshot-01.png)

*[Wallpaper](https://unsplash.com/photos/low-angle-photography-of-trees-during-night-time-_OQ8Jc7kBmA)
by [Jr Korpa](https://unsplash.com/@jrkorpa)*

## Install

This step requires `stow` (GNU Stow) and it does symlinking of dotfiles found in
this repos [`home/`](home/) directory to the user's `$HOME` directory.

On MingW it has no dependencies, it uses `ln -s`.

```bash
./install.sh
```

## Build (optional)

**Read and understand this script before using it, and then use it at your own
risk!**

Install various packages depending on the operating system. Good to run on fresh
OS's.

```bash
./build.sh
```

## Extras

### Commands

For convenience, there are a few commands that these dotfiles set up for you to
run anywhere at any time inside your shell. These are currently just aliases
setup inside [alias.sh](./home/mbromell/.config/mbromell/alias.sh).

1. `dot` Change directory to the dotfiles repo.
2. `dotpull` Pulls and installs any changes on the current checked out branch.
3. `dotsync` Commits all changes and pushes to the current checked out branch.

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

## Pretty Screenshot

![Screenshot 2 of MacOS using dotfiles](images/screenshot-02.png)
