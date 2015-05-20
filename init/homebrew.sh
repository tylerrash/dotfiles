#!/bin/bash

packages=(
    'ack'
    'nodejs'
    'python'
    'tmux'
    'tree'
)

echo Installing Homebrew...
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo Installing Homebrew packages...

for package in ${packages[@]}
do
    echo "Installing ${package}..."
    brew install $package
done

echo Installing cask...
brew install caskroom/cask/brew-cask

echo Homebrew setup complete!
