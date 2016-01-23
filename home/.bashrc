#!/usr/bin/env bash

# Terminal color
export TERM=screen-256color

# Editor
export EDITOR='vim'

# Path to the bash it configuration
export BASH_IT="/home/axolote/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline-plain'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# homeshick and stuff
source $HOME/.homesick/repos/homeshick/homeshick.sh

# Load Bash It
source $BASH_IT/bash_it.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash