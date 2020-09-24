#!/bin/bash

echo "[INFO] SETTING UP WORKING ENVIRONMENT THAT FEELS LIKE HOME --"

# symlink dotfiles
./symlink.sh
# install packages
./packinstall.sh
# apply changes
source ~/.bashrc

echo "Welcome Home!" | figlet -f digital -s -c | lolcat
