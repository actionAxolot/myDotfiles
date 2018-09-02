#!/usr/bin/env bash

docker-compose -f $1 build --force-rm --build-arg SSH_PRIVATE_KEY="$(cat ~/.ssh/id_rsa)" web
