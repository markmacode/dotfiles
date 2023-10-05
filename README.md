# Installation

```bash
git clone https://github.com/mbromell/dotfiles.git
cd dotfiles
./install.sh
```

# Commands

1. `dotpull` Pull the latest changes of the current checked out branch of your
    dotfiles.
2. `dotstow` Just stow the files / folders to $HOME
3. `dotnix` Install the packages saved to
    [`dotfiles/.config/dotifles/packages.nix`](dotfiles/.config/dotifles/packages.nix)
    (Opens in nvim for edit before installing)
4. `dotedit` Open up dotfiles in neovim for editing.
5. `dotsync` Run `dotpull && dotnix && dotstow` for quick machine syncing.
