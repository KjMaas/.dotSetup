# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# add path to packages
# run the following command to know where 'pkg-config' is looking for packages:
# $ pkg-config --variable pc_path pkg-config
export PKG_CONFIG_PATH="$HOME/miniconda3/envs/opencv/lib/pkgconfig/:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH

LD_LIBRARY_PATH="$HOME/miniconda3/lib/:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="$HOME/miniconda3/envs/opencv/lib/:$PKG_CONFIG_PATH"
export LD_LIBRARY_PATH