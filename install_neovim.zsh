#!/bin/zsh

# Move to the downloads folder to download the file
cd ~/Downloads/

# Download latest Neovim AppImage
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

# Make the AppImage executable
chmod u+x nvim.appimage

# Create target directory if it does not exist
sudo mkdir -p /opt/nvim

# Move the AppImage to the target directory
sudo mv nvim.appimage /opt/nvim/nvim

# Make sure that the .zshrc has the directory /opt/nvim in PATH
