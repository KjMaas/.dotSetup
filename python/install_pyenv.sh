#!bin/bash

# pre-requisites needed to install pyenv

# Ubuntu:
if [[ ${DIST_LIKE} == "debian" ]]; then
    sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
        libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
        xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
fi

# Arch:
if [[ ${DIST_LIKE} == "arch" ]]; then
    sudo pacman -S base-devel openssl zlib
fi


curl https://pyenv.run | bash
