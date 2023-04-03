#!/bin/bash

sudo apt update

# Install zsh
sudo apt install zsh

# Install zap
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
