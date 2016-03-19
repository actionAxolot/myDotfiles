#!/usr/bin/env bash

export NVM_DIR="/home/axolote/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Activate whatever node is installed
#nvm use node

# Terminal color
export TERM=screen-256color

# Editor
export EDITOR='vim'

# homeshick and stuff
source $HOME/.homesick/repos/homeshick/homeshick.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add git to prompt and stuff
source /etc/bash_completion.d/git-prompt

# virtualenvwrapper stuff
source /usr/local/bin/virtualenvwrapper_lazy.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '
