#!/bin/bash

# Move to directory and download installer
cd ~/Downloads/
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

# Decompress
zcat < install-tl-unx.tar.gz | tar xf - 

# Install
cd install-tl-20231115/
sudo perl ./install-tl --no-interaction

# Update the PATH in ~/.config/zsh/exports.zsh
