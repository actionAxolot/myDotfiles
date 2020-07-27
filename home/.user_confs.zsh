#source /usr/share/nvm/init-nvm.sh
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

alias vim="nvim"
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

# export VK_ICD_FILENAMES=/etc/vulkan/icd.d/nvidia_icd.json

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# This is windows things
if [ -z "$(pgrep ssh-agent)" ]; then
        rm -rf /tmp/ssh-*
        eval $(ssh-agent -s) > /dev/null
      else
        export SSH_AGENT_PID=$(pgrep ssh-agent)
        export SSH_AUTH_SOCK=$(find /tmp/ssh-* -name agent.*)
fi

