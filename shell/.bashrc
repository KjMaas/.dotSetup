#!/bin/bash

# ~/bashrc: executed by bash(1) for non-login shells.
 # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# sourcing message
echo "
-----------------------
> sourcing .bashrc... <
-----------------------
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


function __promptC (){
    local EXIT="$?"
    local White="\[\033[00;00m\]"
    local WhiteB="\[\033[01;00m\]"
    local Blue="\[\033[00;36m\]"
    local BlueB="\[\033[01;36m\]"
    local Green="\[\033[00;32m\]"
    local GreenB="\[\033[01;32m\]"
    local Red="\[\033[00;31m\]"
    local RedB="\[\033[01;31m\]"
    local Yellow="\[\033[00;33m\]"
    local YellowB="\[\033[01;33m\]"
    if [[ $EXIT != 0 ]]; then

        PS1="\n${BlueB}\u${WhiteB}@${GreenB}\h${White}:${Green}\w"
        local line="`printf -vch "%${COLUMNS}s" ""; printf "%s" "${ch// /-}"`"
        local dts="`date +"%d-%b-%Y %k:%M"`"

        # Git in prompt
        ref=$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3 )
        if [[ ! -z $ref ]]; then
            local stats=$(git diff --shortstat 2> /dev/null | sed -e 's/[a-z,]*//g')
            local stats=$(echo $stats | sed -e 's/\(^.[0-9]*\)\ /\[\1\]:/g' -e 's/\ //g')
            PS1="${PS1} ${Yellow}--- ${GreenB}${dts} ${Yellow}${line:$((${#dts}+${#PS1}+${#ref}+${#stats}))} ${YellowB}[ ${ref} ${stats} ]"
        else
            PS1="${PS1} ${Yellow}--- ${GreenB}${dts} ${Yellow}${line:$((${#dts}+${#PS1}))}"
        fi

        PS1+="\n${RedB}(x)-> ${WhiteB}\$ "

    else
        PS1="\n${BlueB}$(date +"%k:%M") ${GreenB}(✔) ${WhiteB}\$ "
    fi

}
PROMPT_COMMAND=__promptC


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


# Load pyenv automatically when sourcing .bashrc
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

