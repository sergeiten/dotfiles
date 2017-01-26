#!/bin/bash

sudo add-apt-repository ppa:jonathonf/vim

sudo apt-get update -y
sudo apt-get upgrade -y

echo "Installing ZSH ..."
sudo apt-get install vim vim-nox git zsh build-essential cmake python-dev python3-dev nodejs -y

echo "Installing Oh My ZSH ..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing Oh My ZSH Autosuggestions ... "
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "Installing Vim Plug ... "
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c +PlugInstall +qall


