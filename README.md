# mbromell dotfiles

## Build (Optional)

> [!WARNING]
> This alters the system in potentially undesirable ways. Read this section and only do this step if you know you want to do to your system.
>
> This if for setting up a non-configured sytem (MacOS or Linux) by installing the [nix package manager](https://nixos.org/), and also installing common packages (see [packages/nix.sh](packages/nix.sh)).
>
> If you're on MacOS it will also install [homebrew](https://brew.sh/) if it is missing, and install common packages specifically for MacOS (see [packages/brew.sh](packages/brew.sh)).
>
> It will also install `zsh` and [oh-my-zsh](https://ohmyz.sh/) and set `zsh` as the default shell for the current user.
>
> Lastly, it will do the regular `./install.sh` of config files to the `$HOME` directory from this repos [home/](./home) directory.

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

## Install

> [!NOTE]
> If you skipped the Build step, then you will need to make sure you have `stow` installed and on the `$PATH` environment variable.
>
> This step does actual symlinking of dotfiles found in this repos [home/](home/) directory. If you are on a Linux system then the directories listed in [stow/linux.txt](stow/linux.txt) will be stowed, if you are on MacOS then the directories listed in [stow/mac.txt](stow/mac.txt) will be stowed.

If you have not already cloned the repo, then clone and `cd` into it.

```bash
git clone https://github.com/mbromell/dotfiles.git
cd dotfiles
```

Now you can simply run the install script. This will detect if you are on Linux or MacOS, and stow the relevant files.

```bash
./install.sh
```

## Commands

For convenience, there are a few commands that these dotfiles set up for you to run anywhere at any time inside your shell. These are currently just aliases setup inside [alias.sh](./home/mbromell/.config/mbromell/alias.sh).

1. `dotfiles` Open up dotfiles in NeoVim for editing.
2. `dotpull` Pull the latest changes of the current checked out branch of your dotfiles.
3. `dotstow` Runs `./install.sh` script for quick stowing at any time
4. `dot` Runs `dotpull && dotstow` for quick syncing of any changes.

If you are not using `zsh` then be sure to have the following lines inside one
of your own shells setup files.

```bash
source $HOME/.config/mbromell/env.sh
source $HOME/.config/mbromell/alias.sh
```
