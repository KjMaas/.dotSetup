#!/bin/bash

echo "[INFO] installing packages..."

echo "+++ upgradating packages..."
sudo $PACK_MAN update && sudo $PACK_MAN full-upgrade -y


function install {
    # check if call to package is valid 
    # which returns either '0', '1' or '2'
    which ${1} &> /dev/null

    if [[ $? == 0 ]]; then
        echo "=== Already installed: ${1}"
    else
        echo "+++ Installing: ${1}..."
        sudo $PACK_MAN install ${1}
    fi
    }


# Basics
install git
install htop
install curl

# Navigation
install tree
install fzf
install ripgrep
install silversearcher-ag

# text editor!!
install neovim

# Funzies
install figlet
install cowsay
install lolcat
# install toilet

echo "[INFO] finished installing packages!"
