#!/bin/bash
# clone the homeshick repo thing to pull stuff. Also set your keys and all that

# TODO Learn how to check for git and install depending on passed param
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
chmod a+x $HOME/.homesick/repos/homeshick/bin/homeshick

# Now clone the Vim Plug thing
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Let's link it up
$HOME/.homesick/repos/homeshick/bin/homeshick clone git@github.com:actionAxolot/myDotfiles
 
git clone --depth 1 git@github.com:junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo apt install exuberant-ctags

source $HOME/.bashrc
