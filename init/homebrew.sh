#!/bin/bash

packages=(
    'ack'
    'cmake'
    'fzf'
    'httpie'
    'jq'
    'neovim'
    'nodejs'
    'python'
    'tldr'
    'tmux'
    'tree'
    'wget'
)

if brew -v >/dev/null 2>&1; then
    echo Homebrew is already installed.
else
    echo Installing Homebrew...
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo Installing Homebrew packages...

for package in ${packages[@]}
do
    echo "Installing ${package}..."
    brew install $package
done

echo Installing cask...
brew install caskroom/cask/brew-cask

# casks:
# vanilla

echo Homebrew setup complete!
