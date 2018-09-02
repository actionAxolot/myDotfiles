#!/usr/bin/env bash
if [[ ! -z "${NVM_DIR}" ]]; then
    echo "NVM already installed"
    exit 1
fi

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

echo "Please restart shell to make these changes stick"
