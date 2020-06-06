# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
export EDITOR=/usr/bin/nvim
export PAGER=/usr/bin/less
export PDFREADER=/usr/bin/zathura
export HISTTIMEFORMAT="%d.%m.%y %T "
export REPOS="$HOME/repos/"
export MPD_HOST="$HOME/.config/mpd/socket"
export IMAGE=/usr/bin/sxiv

export MENUCONFIG_COLOR="blackbg"

export PATH="$HOME/exec:$HOME/exec/system:$PATH"
export WP_LIST="$HOME/.config/wallpaper_list"
export XDG_CONFIG_HOME="$HOME/.config"

export WINEARCH=win32
export WINEPREFIX=/data/wine
[ -n "$(ps -e | grep dwm)" ] || exec startx
