# mbromell dotfiles

I have tried desigining my dotfiles to work universially, but that was too much
effort for what is supposed to be a personal configuration. So this is designed
to work only for my use case, it may work for you too. This README is here for
my own future reference.

I don't use stow anymore for dotfiles for various reasons, mainly the awkward
file structure it forces me to use. So now I'm using the git bare repo approach.
I learned about this from this article https://www.atlassian.com/git/tutorials/dotfiles

## Install

Install on a new system using the Github **HTTPS** url

```bash
curl -Lks https://raw.githubusercontent.com/mbromell/dotfiles/main/.config/mbromell/install.sh | /bin/bash -s https
```

Install on a new system using **SSH**

```bash
curl -Lks https://raw.githubusercontent.com/mbromell/dotfiles/main/.config/mbromell/install.sh | /bin/bash
```

### Optional Extra Setup

Then if you also want to setup ZSH and install the Nix packages.

```bash
./dotfiles.sh
```

### Do not want ZSH?

If you don't want to use ZSH as your shell, be sure to add the following to your
own shell's setup (such as `.bashrc` or `.profile`).

```bash
if [[ -e "$XDG_CONFIG_HOME/mbromell/setup.sh" ]]; then
    source "$XDG_CONFIG_HOME/mbromell/setup.sh"
fi
```

**Don't want to source that file?** Then at the very least add this alias to
your shell's setup

```bash
alias dot='git --git-dir=$HOME/.dot/ --work-tree=$HOME'
```

## Usage

Ensure that you reset your shell after the install step, or that the `dot` alias
has been set.

Run the `dot` alias just as you would use the `git` command, the `dot` alias
will only affect this dotfiles bare repo on your machine.

```bash
# Check for changes
dot status

# Add a file to the repo
dot add .bashrc

# Commit changes
dot commit -m "New change"

# Push to remote
dot push

# Pull from remote
dot pull
```

## Local Configuration

You can inject configuration on a per-system basis.

- Want to set custom XDG environment values?
- A different `$EDITOR` or `$PAGER`?
- Source more files that git doesn't track?

Then put this configuration inside `$HOME/.zshrc.inject`. Here is an example
`.zshrc.inject` file that you could have just for an Ubuntu machine you have.

```bash
export EDITOR="nano"

function ubuntu_only_function {
    echo "Hello Ubuntu PC"
}
```
