#!bin/bash

# create symlink to windows home folder (if it doesn't already exist)
export WINHOME=""/mnt/c/Users/Klaaz/""
if [ ! -L ~/winhome ]; then
	if [ -d $WINHOME ]; then
		ln -s $WINHOME ~/winhome
		echo "=> windows home ($WINHOME) symlinked to '~/winhome'"
	else
		echo "=> could not symlink Windows home directory ('$WINHOME' doesn't exist)"
	fi
fi

# path to default web-browser
export BROWSER="/mnt/c/Program Files/Mozilla Firefox/firefox.exe"

# add path to 'Floki' dir
export floki_path="/mnt/c/Users/KlaasjanMaas/OneDrive - floki io"

# add path to 'cloud_w' dir
export cloud_work_path="/mnt/c/Users/KlaasjanMaas/floki io"

# export display adress (required for WSL)
set_display_manually=false
if [[ "$set_display_manually" == true ]]; then
    export DISPLAY="172.21.224.1:0"
    export LIBGL_ALWAYS_INDIRECT=1
else
    export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf
    2>/dev/null):0
    export LIBGL_ALWAYS_INDIRECT=1
fi
echo "DISPLAY = "$DISPLAY""

