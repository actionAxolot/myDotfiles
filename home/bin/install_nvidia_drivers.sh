#!/usr/bin/env bash

# First we add the ppa, then we install the whole thing
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
#sudo apt-get install nvidia-387 -y
#sudo apt-mark hold nvidia-384
#sudo apt-get install nvidia-prime -y

echo "Please reboot your system for changes to take effect"
