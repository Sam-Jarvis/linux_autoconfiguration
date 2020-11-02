#!/bin/bash

user="samjarvis"

install_deb(){
    arg1=$1
    arg2=$2

    wget -O $arg1.deb $arg2
    sudo apt install ./$arg1.deb -y
    sudo rm $arg1.deb
}

install_tools(){
    arg1=$1

    if ! command -v $1 &> /dev/null
    then
        sudo apt install $1
    else
        echo "$1 already installed"
    fi
}

install_tools wget
install_tools curl

cd /home/$user/Downloads/

install_deb "discord" "https://discordapp.com/api/download?platform=linux&format=deb"

install_deb "chrome" "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

# Installing vscode
sudo apt install software-properties-common apt-transport-https -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Installing teams
echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" | sudo tee /etc/apt/sources.list.d/teams.list

# add spotify to /etc/apt
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -

echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update

sudo apt-get install teams -y
sudo apt-get install spotify-client -y
sudo apt-get install code -y
sudo apt-get install terminator -y
