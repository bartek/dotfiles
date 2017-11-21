source ~/.git-prompt.sh
source ~/.shell/prompt
source ~/.shell/aliases
source ~/.shell/.functions

# Git Prompt
# Local Status Symbols
# ✔: repository clean
# ●n: there are n staged files
# ✖n: there are n files with merge conflicts
# ✚n: there are n changed but unstaged files
# …n: there are n untracked files
# ⚑n: there are n stash entries
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

source /usr/local/bin/virtualenvwrapper.sh

export GOPATH=$HOME/dev/gocode

export PATH=$PATH:/usr/local/bin

export PATH=$PATH:$GOROOT/bin:/usr/local/sbin:$HOME/bin

# Postgres
export PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH

# npm
export PATH=/usr/local/share/npm/bin:$PATH

# node_modules
export PATH=./node_modules/.bin:$PATH

export PYTHONSTARTUP=~/.pythonstartup

export PATH=$PATH:/usr/local/opt/go/libexec/bin

export EDITOR=/usr/bin/vim

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Necessary for vim to work. Outstanding YouCompleteMe issue:
# https://github.com/Valloric/YouCompleteMe/issues/8
export DYLD_FORCE_FLAT_NAMESPACE=1

# Go Lang 
export PATH=$GOPATH/bin:$PATH

# tmuxinator
source ~/.tmux/tmuxinator.bash

export PATH=$PATH:/usr/local/opt/go/libexec/bin

# React Native Build
export GRADLE_OPTS="-Dorg.gradle.daemon=true"

# hstr
# add this configuration to ~/.bashrc
export HH_CONFIG=hicolor,keywords         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
# if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh \C-j"'; fi

bind '"\C-r": "\C-a hh \C-j"'

# added by travis gem
[ -f /Users/bartekc/.travis/travis.sh ] && source /Users/bartekc/.travis/travis.sh
