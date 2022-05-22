#!/bin/bash

# Install packages
sudo apt update
sudo apt upgrade

sudo apt install tmux git neovim curl powerline apt-file

curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo update
sudo apt install code

# Setup bashrc
echo "source ~/.bashrc.priv" >> ~/.bashrc
cp ./.bashrc.priv ~/
source ~/.bashrc

# Swap escape and caps lock
echo "setxkbmap -option caps:swapescape" >> ~/.profile

# Setup git
git config --global user.email '<>'
git config --global user.name 'neckutrek'

