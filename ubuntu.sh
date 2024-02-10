#!/bin/bash
#
# Ubuntu Setup
#
# Ainsley Clark, ainsley.dev - 15/01/2022

echo "************************************************"
echo "***    Welcome to the Ubuntu System Setup    ***"
echo "************************************************"
echo ""

# Variables
PHP_VERSION="7.4"
GOLANG_VERSION="1.17.5"

# Check if root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Git Variables
echo "What name do you want to use in git user.name?"
read git_config_user_name

echo "What email do you want to use in git user.email?"
read git_config_user_email

# Copy dot files
echo "Copying config files"
# cp ./editorconfig ~/.editorconfig
cp ./.gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# Updates
echo "Running updates"
apt-get -y update
# apt-get -y upgrade

# Curl / Wget
echo "Installing curl"
apt-get install -y curl

# Cmake
echo "Installing cmake"
apt-get install -y cmake

# Git
echo 'Installing latest git'
add-apt-repository ppa:git-core/ppa -y
apt-get -y update && apt-get install git -y

echo "Setting up your git global user name and email"
git config --global user.name "$git_config_user_name"
git config --global user.email $git_config_user_email


# Chrome
echo "Installing Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

# # Edge
# echo "Installing Edge"
# apt install -y software-properties-common apt-transport-https
# wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
# add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"
# apt-get -y update && apt install -y microsoft-edge-dev

# # Go
# echo "Installing GoLang"
# wget https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
# tar -C /usr/local -xvzf go$GOLANG_VERSION.linux-amd64.tar.gz
# rm go$GOLANG_VERSION.linux-amd64.tar.gz

# Docker
echo "Docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker ${USER}
newgrp docker

# Dev tools
echo "Installing dev tools"
apt-get install build-essential


# tmux
echo "Installing tmux"
apt-get install -y tmux
sh tmux.sh


# Productivity
echo "Installing productivity apps"



echo ""
echo "************************************************"
echo "***    Finished, now run ./post-install      ***"
echo "************************************************"
