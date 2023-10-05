# Installation

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mbromell/dotfiles/main/install.sh)"
```

# Commands

1. `dotpull` Pull the latest changes of the current checked out branch of your
    dotfiles.
2. `dotstow` Just stow the files / folders to $HOME
3. `dotnix` Install the packages saved to
    [`dotfiles/.config/dotifles/packages.nix`](dotfiles/.config/dotifles/packages.nix)
4. `dotedit` Open up dotfiles in neovim for editing.
5. `dotnixedit` Open up package list for editing inside neovim.
6. `dotsync` Run `dotpull && dotstow && dotnix` for quick machine syncing.
