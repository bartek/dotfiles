# dotfiles

My dotfiles, largely a work in progress.

```
brew bundle

# copy/clean dotfiles to appropriate places
make

# setup vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# open neovim and install all plugins
:PlugInstall
```

Download relevant nerdfont (JetBrains Mono SemiBold)

https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures/SemiBold
