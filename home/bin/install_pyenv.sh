#!/usr/bin/env bash
if type pyenv > /dev/null; then
    echo "Pyenv already installed"
    exit 1
fi

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev curl


curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

# Add to bash file
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> $HOME/.bashrc

echo 'eval "$(pyenv init -)"' >> $HOME/.bash_profile
echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.bashrc

pyenv update

# Not sure if I should install a version by default. I think I'll just leave
# that to a project by project basis

# Echo that the script finished
echo "Pyenv installed successfully"

