#!/bin/bash

# Install packages
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

sudo apt update
sudo apt upgrade

sudo apt install tmux git curl powerline apt-file mlocate htop tree silversearcher-ag ack ranger
sudo snap install neovim -classic

sudo apt install binutils gcc clang cmake
sudo apt install maven openjdk-8-dbg openjdk-8-jdk-headless
sudo apt install pip
sudo apt install fzy ripgrep nodejs npm

curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo update
sudo apt install code

sudo apt update
sudo apt autoremove

# Install conan
sudo pip install conan

# Setup bashrc
echo "source ~/.bashrc.priv" >> ~/.bashrc
cp ./.bashrc.priv ~/
source ~/.bashrc

# Swap escape and caps lock, and let apple keyboard fn keys be normal
echo "setxkbmap -option caps:swapescape" >> ~/.profile
echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all

# Setup git
git config --global user.email '<>'
git config --global user.name 'neckutrek'

# Setup tmux
cp .tmux.conf ~/.tmux.conf

# Setup ranger
mkdir -p ~/.config/ranger
cp rc.conf ~/.config/ranger/rc.conf

# Neovim setup
pip install --upgrade pynvim
sudo npm install -g neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim/init.vim
cp ./coc.vim ~/.config/nvim/coc.vim

nvim -c ':PlugInstall' +qall
nvim -c ':CocInstall coc-json coc-tsserver coc-clangd' +qall

