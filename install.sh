#!/bin/sh

# Tmux plugin manager
# Installs and loads tmux plugins.
if [ -d ~/.tmux/plugins/tpm ] ; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Starship
if ! command -v starship &> /dev/null
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi