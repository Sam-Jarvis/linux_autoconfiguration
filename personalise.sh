#!/bin/bash

cd ~
mkdir -p Git
cd Git

# ICONS
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd Tela-icon-theme
./install.sh standard blue grey purple manjaro
cd ..

# THEME
git clone https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme
./install.sh -c dark

# SET ICON THEME AND MAIN THEME
gnome-shell-extension-tool -e user-theme
gsettings set org.gnome.desktop.interface gtk-theme Orchis-dark-compact
gsettings set org.gnome.desktop.interface icon-theme Tela-manjaro

# COPY AND SET BACKGROUND
cp no_man_sky.jpg ~/Pictures
gsettings get org.gnome.desktop.background picture-uri
'file://home/samjarvis/Pictures/no_man_sky.jpg'

# COPY CONFIG FILES
sudo cp configs/spotify/ ~/.config/
sudo cp configs/terminator/ ~/.config/
sudo cp .bash_aliases ~

# LOAD KEYBOARD SHORTCUTS
# save: dconf dump / > ~/.config/dconf/user.conf
dconf load / < /configs/user.conf