#!/bin/bash

plugins=(
   'git@github.com:SirVer/ultisnips.git'
   'git@github.com:altercation/vim-colors-solarized.git'
   'git@github.com:christoomey/vim-tmux-navigator.git'
   'git@github.com:easymotion/vim-easymotion.git'
   'git@github.com:ervandew/supertab.git'
   'git@github.com:jistr/vim-nerdtree-tabs.git'
   'git@github.com:kien/ctrlp.vim.git'
   'git@github.com:mkitt/tabline.vim.git'
   'git@github.com:pangloss/vim-javascript.git'
   'git@github.com:scrooloose/nerdcommenter.git'
   'git@github.com:scrooloose/nerdtree.git'
   'git@github.com:tpope/vim-fugitive.git'
   'git@github.com:tpope/vim-surround.git'
)

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

for plugin in ${plugins[@]}
do
    printf "\nCloning ${plugin}...\n"
    git clone $plugin
done
