#!/usr/bin/env bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common docker-ce docker-compose -y

sudo usermod -aG docker ${USER} # Add current user to docker group
