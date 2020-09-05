#!/bin/bash

##############
# my aliases #
##############

# easy access to 'dotSetup' dir
alias cdDot='cd "$dot_path"'

# easy access to 'Floki' dir
alias cdF='cd "$floki_path"'

# easy access to 'cloud_w' dir
alias cdCW='cd "$cloud_work_path"'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias l='ls -alF'
alias n='nvim'
