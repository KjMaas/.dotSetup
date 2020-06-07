#!/bin/bash

# function used to backup files and folders
function backup {
    bkup_path="/mnt/d/WSL_backup/files/"
    if [[ ! -d ${bkup_path} ]]; then
        echo "+++ Creating backup folder ${bkup_path}"
        mkdir -p ${bkup_path}
    fi


    while [[ -n "${1}" ]]; do
        case "${1}" in
            -w) echo "[INFO] -w passed, writting to backup folder"
                echo "       Creating backup: ${2} --> ${bkup_path}${2}"
                mkdir -p "$(dirname -- ${bkup_path}${2})" && cp -rf ${2} ${bkup_path}${2}
                ;;
            -r) echo "[INFO] -r passed, reading from backup folder"
                echo "       Copying backup: ${bkup_path}${2} --> ${2}"
                mkdir -p "$(dirname -- ${2})" && cp -rf ${bkup_path}${2} ${2}
                ;;
        esac
        shift
    done
}

backup "${1}" "${2}"
