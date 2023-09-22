#!/usr/bin/env bash

dotfilesUrl="https://github.com/mark-bromell/dotfiles"
dotfilesPath="$HOME/dotfiles"

use_brew() {
    [[ "$OSTYPE" =~ "(darwin*|linux-gnu)" ]]
} 

use_choco() {
    [[ "$OSTYPE" =~ "(msys)" ]]
}

if use_brew; then
    if ! command -v brew &> /dev/null; then
        echo "WARNING: Homebrew is not installed, will try to install now"
        NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install git
elif use_choco; then
    if ! command -v choco &> /dev/null; then
        echo "WARNING: Cannot find choco, please install or add to PATH https://chocolatey.org/install#individual"
    else
        choco install git
    fi
fi

pushd "$HOME"
if [ -d "$dotfilesPath" ]; then
    echo "WARNING: Directory already exists $dotfilesPath"
    echo "WARNING: Assuming $dotfilesPath is $dotfilesUrl"
else
    echo "Cloning dotfiles into $dotfilesPath"
    git clone "${dotfilesUrl}.git"
fi
popd

pushd "$dotfilesPath"
if use_brew; then
    xargs brew install < _packages/brew.txt
elif use_choco; then
    # git bash
else
    echo "WARNING: \$OSTYPE $OSTYPE not supported, packages wont be installed"
fi
popd

