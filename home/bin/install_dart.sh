#!/usr/bin/env bash
sudo apt update
sudo apt install api-transport-https
sudo sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'

sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'

sudo apt update
sudo apt install dart

sudo ln -s /usr/lib/dart/bin/dart2js /usr/bin/dart2js
sudo ln -s /usr/lib/dart/bin/dartanalyzer /usr/bin/dartanalyzer
sudo ln -s /usr/lib/dart/bin/dartdevc /usr/bin/dartdevc
sudo ln -s /usr/lib/dart/bin/dartdevk /usr/bin/dartdevk
sudo ln -s /usr/lib/dart/bin/dartdoc /usr/bin/dartdoc
sudo ln -s /usr/lib/dart/bin/dartfmt /usr/bin/dartfmt
sudo ln -s /usr/lib/dart/bin/pub /usr/bin/pub
