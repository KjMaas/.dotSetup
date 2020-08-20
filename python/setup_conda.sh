#!bin/bash


# download and install miniconda if it's not already installed
MINICONDA_PATH="/home/kjmaas/miniconda3/"
MINICONDA_DISTRO="Miniconda3-latest-Linux-x86_64.sh"
if [ ! -d "${MINICONDA_PATH}" ]; then
    wget "https://repo.anaconda.com/miniconda/${MINICONDA_DISTRO}"
    bash "/home/kjmaas/${MINICONDA_DISTRO}"
    rm "/home/kjmaas/${MINICONDA_DISTRO}"
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kjmaas/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kjmaas/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kjmaas/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kjmaas/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

