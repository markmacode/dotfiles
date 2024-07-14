# markmacode dotfiles

My personal dotfiles. This readme is for my own future reference. These dotfiles
are not designed to work on your machine, use at your own risk.

## Install

Clone this repo to `$HOME/dotfiles/`, cd into this dir and run `./stow.sh`. If
there are conflicts in the home directory, manually remove those conflicts and
run `./stow.sh` again. The `./stow.sh` file will backup critical directories and
files. Running `./restore.sh` will unstow everything, and it will restore the
critical files to the state they were at before the first stow.

## Do not want ZSH?

If you don't want to use ZSH as your shell, be sure to add the following to your
own shell's setup (such as `.bashrc` or `.profile`).

```bash
if [[ -e "$HOME/.config/personal/setup.sh" ]]; then
    source "$HOME/.config/personal/setup.sh"
fi
```

## Local Configuration

You can inject configuration on a per-system basis.

- Want to set custom XDG environment values?
- A different `$EDITOR` or `$PAGER`?
- Source more files that git doesn't track?

Then put this configuration inside `$HOME/.zshrc.inject`. Here is an example
`.zshrc.inject` file that you could have just for an Ubuntu machine you have.

You can also inject a git config file on a per-system basis, do this by adding
your configuration to `$HOME/.gitconfig.inject`
