#!/bin/sh

# From https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95
# Fix colors on MacOS
curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz
sudo /usr/bin/tic -xe tmux-256color terminfo.src
sudo /usr/bin/tic -xe alacritty-direct,tmux-256color terminfo.src
infocmp -x tmux-256color