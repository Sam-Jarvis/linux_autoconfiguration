#!/bin/bash

removables='aisleriot evolution gnome-games five-or-more four-in-a-row gnome-music iango lightsoff mlterm quadrapassel rhythmbox swell-foop gnome-tali xiterm+thai thunderbird xterm'

for var in $removables
do
    sudo apt-get remove $var -y
done

sudo apt autoremove -y