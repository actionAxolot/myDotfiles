source /usr/share/nvm/init-nvm.sh
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

export VK_ICD_FILENAMES=/etc/vulkan/icd.d/nvidia_icd.json
