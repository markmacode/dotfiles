#!/usr/bin/env bash

#
# Install Homebrew
#
if ! command -v brew >/dev/null; then
  # Check if I have sudo permission, if not then install in user dir
  prompt=$(sudo -nv 2>&1)
  if [ $? -eq 0 ] || echo "$prompt" | grep -q '^sudo:'; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    mkdir -p "$HOME/.homebrew"
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "$HOME/.homebrew"
    export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
  fi

  # Put the fresh install on PATH for the rest of this script
  for brew_bin in /opt/homebrew/bin/brew "$HOME/.homebrew/bin/brew" /home/linuxbrew/.linuxbrew/bin/brew; do
    if [[ -x "$brew_bin" ]]; then
      eval "$("$brew_bin" shellenv)"
      break
    fi
  done
else
  brew update
fi
brew bundle

#
# Setup ~/me dir
#
mkdir -p $HOME/me/
mkdir -p $HOME/me/repos
mkdir -p $HOME/me/remotes
mkdir -p $HOME/me/clones
ln -snf $(pwd) $HOME/me/dotfiles

#
# Setting up ZSH
#
if [[ "$SHELL" != "$(which zsh)" ]]; then
  echo "Setting ZSH as default shell"
  command -v zsh | sudo tee -a /etc/shells
  sudo chsh -s $(which zsh) $USER
fi

if [[ -z "${ZSH}" ]]; then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    "" --keep-zshrc --unattended
fi

declare -a custom_plugins=(
  "zdharma-continuum/fast-syntax-highlighting"
  "zsh-users/zsh-autosuggestions"
  "marlonrichert/zsh-autocomplete"
)
for repo in "${custom_plugins[@]}"; do
  plugins_path="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"
  repo_path="${plugins_path}/${repo#*/}"
  # Get repo name after slash because that is what the dir name is
  # If it is already there, then update it
  if [ -d "$repo_path" ]; then
    echo "Updating ZSH plugin $repo"
    git -C "$repo_path" pull
  else
    echo "Downloading ZSH plugin $repo"
    git clone https://github.com/${repo}.git "$repo_path"
  fi
done

#
# Extra app inits
#
echo "Installing stable neovim through bob"
bob use stable

echo "Setting lazy.nvim plugins to the lockfile versions"
nvim --headless "+Lazy! restore" +qa

echo "Restart terminal for changes to take effect"
