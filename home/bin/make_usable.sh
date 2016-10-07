#!/usr/bin/env bash
sudo apt install vim
sudo apt install xubuntu-restricted-extras
sudo apt install libavcodec-extra
sudo apt install libdvd-pkg
sudo apt install openjdk-8-jdk
sudo apt install tmux
sudo apt install keepass2
sudo apt install git-core

# Install ubuntu make
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
sudo apt update
sudo apt install ubuntu-make

# Now let's install tlp stuff for my thinkpad
sudo add-apt-repository ppa:linrunner/tlp
sudo apt update
sudo apt install tlp tlp-rdw
sudo tlp start

sudo apt install smartmontools ethtool
sudo apt install tp-smapi-dkms

# Now let's set git and stuff
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global difftool.prompt false
