# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
export EDITOR=/usr/bin/nvim
export PAGER=/usr/bin/less
export BROWSER=/usr/bin/dillo
export PDFREADER=/usr/bin/zathura
export HISTTIMEFORMAT="%d.%m.%y %T "
export REPOS="$HOME/repos/"
export MPD_HOST="$HOME/.config/mpd/socket"
export IMAGE=/usr/bin/sxiv
export VIDEO_PLAYER=/usr/bin/mpv

export MENUCONFIG_COLOR="blackbg"

export PATH="$HOME/exec:$HOME/exec/system:$PATH"
export WP_LIST="$HOME/.config/wallpaper_list"
export XDG_CONFIG_HOME="$HOME/.config"

export STEAMLIB1=/data/games/steamlib

export WINEARCH=win32
export WINEPREFIXES=/data/wine_prefixes
export WINEPREFIX=/data/wine_prefixes/.wine
export WRYE_BASH=$REPOS/github.com/wrye-bash

export SKYRIM=$WINEPREFIXES/skyrim/drive_c/Steam/steamapps/common/Skyrim
export SKYRIMPREFS=$WINEPREFIXES/skyrim/drive_c/users/steamuser/My\ Documents/my\ games/skyrim

[ -n "$(ps -e | grep dwm)" ] || exec startx
