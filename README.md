# dotfiles

My dotfiles, largely a work in progress.

```
brew bundle

# copy/clean dotfiles to appropriate places
make

# setup vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# open neovim and install all plugins
:PlugInstall
