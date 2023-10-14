# mbromell dotfiles

## Build (Optional)

> [!WARNING]
> This alters the system in potentially undesirable ways. The main things this step does is install `nix`, `zsh`, and various packages. Check the script [build.sh](build.sh) to see what exactly is does, and use it if you are comfortable with it.

First off you will need to clone the repo and `cd` into it.

```bash
git clone https://github.com/mbromell/dotfiles.git
cd dotfiles
```

Now run the following if you want to install `nix` just for the current user. This is good if you don't have access to elevated permissions, or if you don't want to alter the system for all users. (This will not work for MacOS, I have set the script to just install for all users on MacOS)

```bash
./build.sh --user
```

If you want to install `nix` for all users, then run the following command. For more detials on the difference of the `nix` installs, see https://nixos.org/download.html

```bash
./build.sh
```

**If nix was installed, you will have to run `./build.sh` again to finish the rest of the build script since it resets to shell to complete the install of nix.**

## Install

If you skipped the [Build](#build-optional) step, then you will need to make sure you have `stow` installed.

Using 'GNU Stow', this step does symlinking of dotfiles found in this repos [home/](home/) directory to the users `$HOME` directory. If you are on a Linux system then the directories listed in [stow/linux.txt](stow/linux.txt) will be stowed, if you are on MacOS then the directories listed in [stow/mac.txt](stow/mac.txt) will be stowed.

If you have not already cloned the repo, then clone and `cd` into it.

```bash
git clone https://github.com/mbromell/dotfiles.git
cd dotfiles
```

Now you can simply run the install script. This will detect if you are on Linux or MacOS, and stow the relevant files.

```bash
./install.sh
```

## Usage

### Extending with `.zprofile`

You may have noticed that there is no `.zprofile` being maintained by these dotfiles. On each of your systems where you use these dotfiles, if you have specific configurations per-system, then you can put it inside the `~/.zprofile` file.

I experimented with using a custom `.zshinject` file for this purpose, but I'd rather stick to known defaults rather than going further down the road of customization.

### Commands

For convenience, there are a few commands that these dotfiles set up for you to run anywhere at any time inside your shell. These are currently just aliases setup inside [alias.sh](./home/mbromell/.config/mbromell/alias.sh).

1. `dotfiles` Open up dotfiles in your editor.
2. `dotpull` Pull the latest changes of the current checked out branch of your dotfiles.
3. `dotstow` Just runs `./install.sh` script
4. `dot` Runs `dotpull && dotstow` for quick syncing of any changes.

If you are not using `zsh` then be sure to have the following lines inside one
of your own shells setup files.

```bash
source $HOME/.config/mbromell/env.sh
source $HOME/.config/mbromell/alias.sh
```

## File Structure

### [home/](home/)

This directory will store the configuration files that are going to be stowed inside of the current user `$HOME` directory. It will do this using [GNU stow](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

### [packages/](packages/)

Scripts for installing packages. Each file should only install packages related to certain package manager, but I guess nothing is stopping us from creating any script here, it's pupose should just be to install packages though.

### [scripts/](scripts/)

Arbitrary scripts that help other scripts inside the dotfiles repo. If there's some code duplication across multiple scripts, rip it out and put it here to `source` it inside the scripts where it was duplicated.

### [stow/](stow/)

Plain text files which list stow files for different environments, the lists should be space-separated.
