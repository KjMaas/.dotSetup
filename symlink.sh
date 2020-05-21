#!/bin/bash

echo "[INFO] symlinking dotfiles..."


function linkDotfile {
    if [[ -z $2 ]]; then
        # if no folder argument is provided, create symlink @HOME
        destFolder="${HOME}"
    else
        # else put create it at the given location
        destFolder="${HOME}/${2}"
    fi

    dest="${destFolder}/${1}"
    dateStr=$(date +%Y-%m-%d-%H%M)

    # remove symlink if it already exists
    if [ -L "${dest}" ]; then
        echo "--- Removing existing symlink: ${dest}"
        rm ${dest} 

    # backup file if it already exists
    elif [ -f "${dest}" ]; then
        echo "<<< Backing up existing file: ${dest} --> ${dest}.${dateStr}"
        mv ${dest}{,.${dateStr}}

    # backup directory if it already exists
    elif [ -d "${dest}" ]; then
        echo "<<< Backing up existing dir: ${dest} --> ${dest}.${dateStr}"
        mv ${dest}{,.${dateStr}}
    fi

    # create folders arborescence (if needed)
    if [[ ! -d ${destFolder} ]]; then
        echo "+++ Creating directory arborescence ${destFolder}"
        mkdir -p ${destFolder}
    fi

    # create symlink
    echo "+++ Creating new symlink: ${dest} --> ${dotfilesDir}/${1}"
    ln -s ${dotfilesDir}/${1} ${dest}
}

# Symlink shell stuff
cd shell/
dotfilesDir=$(pwd)
linkDotfile .bash_aliases
linkDotfile .bash_autocomplete
linkDotfile .bash_func
linkDotfile .bash_history
linkDotfile .bashrc
cd ../

# Symlink NeoVim-related stuff
cd NeoVim/
dotfilesDir=$(pwd)
linkDotfile init.vim .config/nvim
linkDotfile python.vim .config/nvim/ftplugin
cd ../


echo "[INFO] symlinking done!"