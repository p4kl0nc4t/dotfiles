[[ -f ~/.Xresources ]] && xrdb -merge "${HOME}/.Xresources"

# this let you toggle between different keyboard layouts
sh ./.fehbg &

# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID
export OOO_FORCE_DESKTOP=gnome

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export TERMINAL='xfce4-terminal'
export PATH=$PATH:~/.local/bin

# Launch i3 window manager
exec i3
