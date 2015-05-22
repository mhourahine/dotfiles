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


