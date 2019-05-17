# dotfiles

My collection of OSX dotfiles.  On each Mac I use, I clone this repo into ~/dotfiles and then create the following symlinks (i.e. ln -s dotfile/file .file):

Symlinks:

```
ln -s ~/dotfiles/vimrc .vimrc
ln -s ~/dotfiles/vim .vim
ln -s ~/dotfiles/gvimrc .gvimrc
ln -s ~/dotfiles/zshrc .zshrc
```

When you clone this repo, use the following to include all submodules in the vim bundle directory:

`git clone --recursive url_of_this_repo`

## VIM plugins

Here are the VIM plugins that are currently included and why I use them:

- ack.vim - for fast project-wide searching
- vim-addon-mw-utils - required by other plugins
- vim-fugitive - Git integration
- vim-sensible - includes a common set of default vim settings
- fzf.vim - fast finding and switching files within a project
- vim-airline - adds a nice status bar at the bottom with git status integration
- vim-markdown - support for markdown syntax highlighting
- vim-snipmate - more TextMate-style snippets
- nerdtree - for project directory browsing / manipulation
- vim-bundler - more rails support (Gemfile formatting)
- vim-multiple-cursors - for multi-line editing
- vim-snippets - supports a variety of code snippets (don't use this much tbh)
- tlib_vim - support library required by other plugins
- vim-easymotion - really powerful but don't use much at the moment, included because it's good to have goals in life.
- vim-rails - rails erb snippet support and more
- vim-surround - super handy plugin, quickly wrap any text with markup
- syntastic - Syntax checker plugin, works with many different linters
- syntastic-local-eslint.vim - Handy addition to syntastic with forces eslint to use the local npm version (the recommended way)

## Packages to install

```
zsh
vim
fzf
tmux
ack
ag
gtop #for unixporn
neofetch #for unixporn
pip3 install gcalcli #for gcal command line
```


# On Debian

## Install npm

```
sudo apt-get install curl software-properties-common
curl -sL https://deb.nodesource.com/setup_11.x | sudo bash -
sudo apt-get install -y nodejs

```
