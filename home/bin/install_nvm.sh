#!/usr/bin/env bash
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash

source $HOME/.bashrc
source $HOME/.zshrc
# SEt the default node version to use
nvm install node
nvm alias default node
