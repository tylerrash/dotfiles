#!/bin/bash

packages=(
    'ack'
    'cmake'
    'diff-so-fancy'
    'fd'
    'fzf'
    'git'
    'httpie'
    'jq'
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
brew install ${packages[@]}

echo Installing cask...
brew install homebrew/cask-cask 

# casks:
# vanilla

echo Homebrew setup complete!
