
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=adwaita-dark

#Setup X
export XDG_CONFIG_HOME=$HOME/.config

export XDG_CACHE_DIR=/home/jp/.cache
export XDG_DATA_DIR=/home/jp/.data
export XDG_CONFIG_DIR=/home/jp/.config

#Set up user bin
export PATH=/home/jp/.local/bin:/home/jp/snap/flutter/common/flutter/bin:/home/jp/.local/share/Android/Sdk/tools/bin/:$PATH

export TERM=xterm-256color


if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi