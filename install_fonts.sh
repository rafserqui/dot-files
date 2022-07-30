#!/bin/bash

cd ~

# Powerline Fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh

# clean-up a bit
cd ..
rm -rf fonts

# Iosevka
wget https://github.com/be5invis/Iosevka/releases/download/v11.2.3/super-ttc-iosevka-11.2.3.zip
unzip super-ttc-iosevka-11.2.3.zip
mv ./super-ttc-iosevka-11.2.3/sgr-iosevka-term.ttc ~/.fonts/

git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1
cd ./nerd-fonts
./install.sh

