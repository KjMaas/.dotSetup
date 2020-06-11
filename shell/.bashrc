#!/bin/bash

# ~/bashrc: executed by bash(1) for non-login shells.
 # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# sourcing message
echo "
------------------------------
> [INFO] sourcing .bashrc... <
------------------------------
" | lolcat -p 0.1 -F 0.01 -a -d 1 -s 10

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# configure default text editor ('nvr' == NeoVim-remote)
export VISUAL="nvr -o"
export EDITOR="nvr -o"
export DISPLAY=192.168.1.91:0
export LIBGL_ALWAYS_INDIRECT=1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Custom paths
if [ -f ~/.bash_paths ]; then
    . ~/.bash_paths
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# function (and other multi-line loops) definitions.
if [ -f ~/.bash_func ]; then
    . ~/.bash_func
fi

# add list of autocompletions
if [ -f ~/.bash_autocomplete ]; then
    . ~/.bash_autocomplete
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi


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

# ------------------------------------------------------------------------------
# add Ultimate Time Tracker (UTT)
if ! python -c "import utt" 2>/dev/null; then
    printf '\- Ultimate Time Tracker \-
    utt is not installed. To install it use:
    \$ pip install utt
    If installed, add:
    \$ register-python-argcomplete utt >> ~/.bashrc
    to enable auto-completion (uses 'bash-completion')\n\n'
fi

# ------------------------------------------------------------------------------
