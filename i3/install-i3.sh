#!/bin/bash

###
# Install and setup i3 config
#
# TODO: Scrape latest versions
###

# Variables
TEMP_FOLDER=temp-i3-install-folder
SCRIPTS_FOLDER=scripts
FONT_AWESOME_VERSION=v4.7.0
SLACK_VERSION=2.8.1

# Update system
sudo apt-get update
sudo apt-get upgrade

# Install dependencies TODO answer yes on everything
# sudo apt-get install git
sudo apt-get install i3
sudo apt-get install lxappearance
sudo apt-get install xtrlock
sudo apt-get install feh
sudo apt-get install i3blocks
sudo apt-get install thunar
sudo apt-get install fontconfig-infinality
sudo apt-get install arandr
sudo apt-get install xrandr
sudo apt-get install rofi
sudo apt-get install vim
sudo apt-get install tree
sudo apt-get install xclip
sudo apt-get install nodejs

# Install arc-theme
# sudo apt-get install arc-theme
git clone https://github.com/horst3180/arc-theme --depth 1 && cd arc-theme
./autogen.sh --prefix=/usr
sudo make install

# Install arc icons
# sudo apt-get install arc-icons
git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme
./autogen.sh --prefix=/usr
sudo make install

# Create temp installation folder
mkdir ~/${TEMP_FOLDER} && cd ~/${TEMP_FOLDER}

# Get San Francisco font
wget -O ~/${TEMP_FOLDER}/yosemitefont.zip https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip
unzip ~/${TEMP_FOLDER}/yosemitefont.zip
mkdir -p ~/.fonts && mv ~/${TEMP_FOLDER}/YosemiteSanFranciscoFont-master/*.ttf ~/.fonts

# Get Font Awesome font
wget -O ~/${TEMP_FOLDER}/fontawesome.zip https://github.com/FortAwesome/Font-Awesome/archive/${FONT_AWESOME_VERSION}.zip
unzip ~/${TEMP_FOLDER}/fontawesome.zip
mkdir -p ~/.fonts && mv ~/${TEMP_FOLDER}/Font-Awesome-4.7.0/fonts/*.ttf ~/.fonts

# Get chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget -O ~/${TEMP_FOLDER}/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/${TEMP_FOLDER}/chrome.deb

# Get spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# Get atom
wget -O ~/${TEMP_FOLDER}/atom.deb https://atom.io/download/deb
sudo dpkg -i ~/${TEMP_FOLDER}/atom.deb

# Install Atom packages

# Install slack
wget -O ~/${TEMP_FOLDER}/slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-${SLACK_VERSION}-amd64.deb
sudo dpkg -i ~/${TEMP_FOLDER}/slack.deb

# Move config scripts

mkdir -p ~/.config/${SCRIPTS_FOLDER}

# Get screen brightness script
wget -O ~/${TEMP_FOLDER}/screen-brightness.js https://raw.githubusercontent.com/JohanGustafsson91/screen-brightness/master/src/index.js
mv ~/${TEMP_FOLDER}/screen-brightness.js ~/.config/${SCRIPTS_FOLDER}

mkdir -p ~/.config/i3

# Get i3 config
wget -O ~/${TEMP_FOLDER}/config-i3 https://raw.githubusercontent.com/JohanGustafsson91/config/master/i3/config
mv ~/${TEMP_FOLDER}/config-i3 ~/.config/i3/config

# Get i3blocks config
wget -O ~/${TEMP_FOLDER}/i3blocks.conf https://raw.githubusercontent.com/JohanGustafsson91/config/master/i3/i3blocks.conf
mv ~/${TEMP_FOLDER}/i3blocks.conf ~/.config/i3/i3blocks.conf

# Get disable touchpad script
# TODO

# google-chrome http://fontawesome.io/cheatsheet/ &
# https://www.google.se/chrome/browser/desktop/index.html
# https://github.com/acrisci/playerctl/releases
# https://github.com/FortAwesome/Font-Awesome/releases
