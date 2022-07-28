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

# VS Code
sudo apt install code -y

# Calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/Downloads/
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb

# Spotify
flatpak install flathub com.spotify.Client

# Skype
flatpak install flathub com.skype.Client

# R and RStudio
sudo apt install r-base -y

wget https://download1.rstudio.org/desktop/jammy/amd64/rstudio-2022.07.1-554-amd64.deb -P ~/Downloads/
sudo apt install ~/Downloads/rstudio-2022.07.1-554-amd64.deb -y

# GNOME Tweaks
sudo apt install gnome-Tweaks -y

# Kitty Terminal
sudo apt install kitty

# Config files for kitty into .config/kitty
mkdir ~/.config/kitty/
cd ~/.config/kitty/
wget https://raw.githubusercontent.com/rxyhn/bspdots/main/config/kitty/color.ini
cp ~/Documents/dot-files/kitty.conf .
cd ~/Downloads/

# Install bat 
sudo apt install bat -y

# Install lsd
cd ~/Downloads/
wget https://github.com/Peltoche/lsd/releases/download/0.22.0/lsd_0.22.0_amd64.deb -P ~/Downloads/
sudo dpkg -i lsd_0.22.0_amd64.deb

# To select kitty as default terminal emulator use the command
# sudo update-alternatives --config x-terminal-emulator
# Then choose kitty

# Anaconda

# 1. Pre-requisites
sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

# 2. Download installer
wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -P ~/Downloads/

# 3. Install Anaconda
bash ~/Downloads/Anaconda3-2021.11-Linux-x86_64.sh

# 4. Source file
source ~/.bashrc

# Julia
cd ~/Downloads/
mkdir ~/Downloads/julia-dist/
wget https://julialang-s3.julialang.org/bin/linux/x64/1.7/julia-1.7.0-linux-x86_64.tar.gz -P ~/Downloads/julia-dist
tar -xvzf ~/Downloads/julia-dist/julia-1.7.0-linux-x86_64.tar.gz
cd ~/Downloads/julia-dist/julia-1.7.0-linux-x86_64/julia-1.7.0/bin/
./julia

# TeX Live
mkdir ~/Downloads/tex-live/
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -P ~/Downloads/tex-live/
tar -xvzf ~/Downloads/tex-live/install-tl-unx.tar.gz
cd ~/Downloads/tex-live/install-tl-20220727/
sudo ./install-tl

