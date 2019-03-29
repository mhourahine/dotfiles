#!/bin/bash
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc

# set up all symlinks
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/vim ~/.vim
ln -s $(pwd)/gvimrc ~/.gvimrc
ln -s $(pwd)/zshrc ~/.zshrc
ln -s $(pwd)/ackrc ~/.ackrc
ln -s $(pwd)/scss-lint.yml ~/.scss-lint.yml
ln -s $(pwd)/tmux.conf ~/.tmux.conf

# pull and update git submodules
git submodule update --init --recursive
git submodule foreach git pull origin master

# install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

