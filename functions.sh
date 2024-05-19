#!/bin/bash

# Check if root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


# Update
function update_ubuntu_source() {
  echo "update"
  sudo apt-get update
}

# Dev tools
function install_ubuntu_tools_dev() {
  echo "Installing dev tools"
  sudo apt-get install -y --no-install-recommends \
  build-essential
}

# Tmux
function install_ubuntu_tools_tmux() {
  echo "Installing tmux"
  sudo apt-get install -y --no-install-recommends \
  tmux

  git clone --recursive https://github.com/touchao123/tmux-config.git ~/.tmux
  ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
  cd ~/.tmux
  git submodule init
  git submodule update
  cd ~/.tmux/vendor/tmux-mem-cpu-load
  mkdir build; cd build
  cmake ..
  make
  sudo make install
  cd ~
}

# net debug tools
function install_ubuntu_tools_net() {
  echo "Installing tcpdump bind-utils net-tools"
  sudo apt-get install -y --no-install-recommends \
  bind9-utils \
  tcpdump \
  net-tools
}

# system supervisor tools
function install_ubuntu_tools_system() {
  echo "Installing system monitor tools"
  sudo apt-get install -y --no-install-recommends \
  duf \
  htop \
  iotop \
  iftop 
}


# Productivity
echo "Installing productivity apps"

# Chrome
function install_ubuntu_chrome(){
  echo "Installing Chrome"
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  apt install ./google-chrome-stable_current_amd64.deb
  rm ./google-chrome-stable_current_amd64.deb
}

# Docker
function install_ubuntu_docker(){
  echo "Docker"
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
}


# Install packages present in all supported versions of Ubuntu
function install_ubuntu_common_requirements() {
  sudo apt-get install -y --no-install-recommends \
  build-essential \
  ca-certificates \
  curl \
  cmake \
  pkg-config \
  make \
  cppcheck \
  libtool \
  valgrind \
  openssh-server 

  install_ubuntu_tools_dev
  install_ubuntu_tools_net

  install_ubuntu_tools_tmux
  # install_ubuntu_docker
  # install_ubuntu_chrome


}

# Install Ubuntu 22.04 LTS packages
function install_ubuntu_lts_latest_requirements() {
  update_ubuntu_source
  install_ubuntu_common_requirements
}


# Detect OS using /etc/os-release file
function automatically_install_all(){

  if [ -f "/etc/os-release" ]; then
    source /etc/os-release
    case "$VERSION_CODENAME" in
      "jammy")
        install_ubuntu_lts_latest_requirements
        ;;
      "kinetic")
        # install_ubuntu_lts_latest_requirements
        echo "$ID $VERSION_ID is unsupported."
        ;;
      "focal")
        # install_ubuntu_focal_requirements
        echo "$ID $VERSION_ID is unsupported."
        ;;
      *)
        echo "$ID $VERSION_ID is unsupported. This setup script is written for Ubuntu 20.04."
    esac
  else
    echo "No /etc/os-release in the system"
    exit 1
  fi

}

# echo ""
# echo "************************************************"
# echo "***    Configration      ***"
# echo "************************************************"

# configuration
function config_ubuntu_git() {

  echo "Copying config files"
  # cp ./editorconfig ~/.editorconfig
  cp ./.gitignore ~/.gitignore
  git config --global core.excludesfile ~/.gitignore

  # Git Variables
  echo "What name do you want to use in git user.name?"
  read git_config_user_name

  echo "What email do you want to use in git user.email?"
  read git_config_user_email

  echo "Setting up your git global user name and email"
  git config --global user.name "$git_config_user_name"
  git config --global user.email $git_config_user_email
}

# Docker
function config_ubuntu_docker(){
  # newgrp docker
  usermod -aG docker ${USER}
}
