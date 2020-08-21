#!bin/bash

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



