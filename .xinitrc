#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge "${HOME}/.Xresources"


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export GPG_TTY=$(tty)

# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --daemonize --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export TERMINAL='xfce4-terminal'
export PATH=$PATH:~/.local/bin

# Launch i3 window manager
exec dbus-launch --sh-syntax --exit-with-session i3
exec i3
