#!/usr/bin/env bash

# 
# Installing Homebrew
#
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -f /home/linuxbrew/.linuxbrew/bin/brew ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew bundle

#
# Setting up the ~/me directory
#
mkdir -p $HOME/me $HOME/me/clones $HOME/me/inbox $HOME/me/repos
ln -sfn $HOME/.config $HOME/me/config
ln -sfn $HOME/ $HOME/me/home

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
        git clone https://github.com/${repo}.git "$plugins_path"
    fi
done

# tjHj
# Extra app inits
#
echo "Setting lazy.nvim plugins to the lockfile versions"
nvim --headless "+Lazy! restore" +qa

echo "Building bat cache"
bat cache --build

echo "Install NVM and Node"
mkdir $HOME/.nvm
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"
nvm install --lts

echo "Restart terminal for changes to take effect"
