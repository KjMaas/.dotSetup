#!/bin/bash


mountDrive () {
    echo "[INFO] mounting drive $1 ..."
    if [[ "$1" == "oneDp" ]]; then
        rclone --vfs-cache-mode writes mount onedrive-personal: $HOME/OneDrive-p
    fi
    echo "     -> done!"
}


unmountDrive () {
    echo "[INFO] un-mounting drive $1 ..."
    if [[ "$1" == "oneDp" ]]; then
        rclone unmount \"onedrive-personal\"
    fi
    echo "     -> done!"
}


if [[ "$1" == "unmount"* ]]; then
    unmountDrive $2
fi

if [[ "$1" == "mount"* ]]; then
    mountDrive $2
fi

# exit 0
