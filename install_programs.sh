#!/bin/bash

sudo apt update -y

# Icon themes
git clone https://github.com/vinceliuice/Qogir-icon-theme.git  ~/Downloads/Qogir-icon-theme
cd ~/Downloads/Qogir-icon-theme/
sudo ./install.sh
cd ~

git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git ~/Downloads/Tela-Theme/
cd ~/Downloads/Tela-Theme/
sudo ./install.sh

# Zathura
sudo apt install zathura -y

# Lighthaus theme
git clone https://github.com/lighthaus-theme/zathura ~/.config/zathura/

# Add zathurarc for config 
cp ~/Documents/dot-files/zathurarc ~/.config/zathura/

# Make zathura the default pdf reader
xdg-mime default org.pwmt.zathura.desktop application/pdf

# Calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Spotify
flatpak install flathub com.spotify.Client

# Skype
flatpak install flathub com.skype.Client

# Flameshot
flatpak install flathub org.flameshot.Flameshot

# Install Obsidian
flatpak install flathub md.obsidian.Obsidian

# GNOME Tweaks
sudo apt install gnome-tweaks -y

# Install bat 
sudo apt install bat -y

# Install lsd
cd ~/Downloads/
wget https://github.com/lsd-rs/lsd/releases/download/v1.0.0/lsd-musl_1.0.0_amd64.deb
sudo dpkg -i lsd-musl_1.0.0_amd64.deb
rm -rf lsd-musl_1.0.0_amd64.deb
cd ~

# Install alacritty
sudo apt install alacritty -y

# To select alacritty as default terminal emulator use the command
# sudo update-alternatives --config x-terminal-emulator
# Then choose alacritty

# Install vivid
cd ~/Downloads/
wget "https://github.com/sharkdp/vivid/releases/download/v0.9.0/vivid-musl_0.9.0_amd64.deb"
sudo dpkg -i vivid-musl_0.9.0_amd64.deb
rm -rf vivid-musl_0.9.0_amd64.deb
# Add to the .zshrc
# export LS_COLORS="$(vivid generate snazzy)"

# Install ranger
cd ~/Documents/dot-files/
sudo apt install ranger -y
cp -r ranger/ ~/.config/

# Install ueberzug for image preview
cd ~/Downloads/

# Install dependencies
sudo apt-get install libssl-dev libvips-dev libsixel-dev libchafa-dev libtbb-dev

# Install Ueberzug++
wget "https://download.opensuse.org/repositories/home:/justkidding/xUbuntu_22.04/amd64/ueberzugpp_2.9.2_amd64.deb"
sudo dpkg -i ueberzugpp_2.9.2_amd64.deb

# Install btop
cd ~/Documents/dot-files/
sudo apt install btop -y
cp -r ./btop/ ~/.config/

# Install fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install Dropbox
cd ~/Downloads/
wget "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb"
sudo dpkg -i dropbox_2020.03.04_amd64.deb
rm -rf dropbox_2020.03.04_amd64.deb

# Install node for some language servers
cd ~/Downloads/
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvm install node

# Install Julia
cd ~/Downloads/
wget "https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.4-linux-x86_64.tar.gz"
tar xf julia-1.9.4-linux-x86_64.tar.gz
mv ./julia-1.9.4/ ~/
rm -rf julia-1.9.4-linux-x86_64.tar.gz

# Install R language
sudo apt install r-base -y
