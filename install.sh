#!/bin/sh

# Tmux plugin manager
# https://github.com/tmux-plugins
if ! [ -d ~/.tmux/plugins/tpm ] ; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Starship
# https://starship.rs
if ! command -v starship &> /dev/null ; then
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi

# Vim
if ! [ -d ~/.vim/backups ] ; then
    mkdir -p ~/.vim/backups
fi

if ! [ -d ~/.vim/swaps ] ; then
    mkdir -p ~/.vim/swaps
fi

if ! [ -d ~/.vim/undo ] ; then
    mkdir -p ~/.vim/undo
fi

if ! [ -d ~/.vim/plugged ] ; then
    mkdir -p ~/.vim/plugged
fi

# Vim plug
# https://github.com/junegunn/vim-plug
if ! [ -f ~/.vim/autoload/plug.vim ] ; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Neovim
if ! [ -f "${XDG_DATA_HOME:-HOME/.local/share}"/nvim/site/autoload/plug.vim ] ; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# zplug
# https://github.com/zplug/zplug
if ! [ -d ~/.zplug ] ; then
    git clone https://github.com/zplug/zplug ~/.zplug
fi

# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh