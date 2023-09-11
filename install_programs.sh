#!/bin/bash

sudo apt update -y

# Icon theme
git clone https://github.com/vinceliuice/Qogir-icon-theme.git  ~/Downloads/
cd ~/Downloads/Qogir-icon-theme/
sudo ./install.sh
cd ~

# Zathura
sudo apt install zathura -y

# Lighthaus theme
git clone https://github.com/lighthaus-theme/zathura ~/.config/zathura/

# Add zathurarc for config 
cp ~/Downloads/dot-files/zathurarc ~/.config/zathura/

# Make zathura the default pdf reader
xdg-mime default org.pwmt.zathura.desktop application/pdf

# Calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Spotify
flatpak install flathub com.spotify.Client

# Skype
flatpak install flathub com.skype.Client

# GNOME Tweaks
sudo apt install gnome-tweaks -y

# Install bat 
sudo apt install bat -y

# Install lsd
sudo apt install lsd -y

# To select alacritty as default terminal emulator use the command
# sudo update-alternatives --config x-terminal-emulator
# Then choose alacritty

# Install vivid
wget "https://github.com/sharkdp/vivid/releases/download/v0.8.0/vivid_0.8.0_amd64.deb"
sudo dpkg -i vivid_0.8.0_amd64.deb
# Add to the .zshrc
# export LS_COLORS="$(vivid generate snazzy)"
