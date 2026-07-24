#!/bin/bash

sudo dnf upgrade -y

# Install zsh
sudo apt install zsh

# Change default shell
chsh -s $(which zsh)

# Install zap
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
