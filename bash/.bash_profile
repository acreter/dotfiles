# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
export PATH="$HOME/exec:$HOME/exec/system:$PATH"
export WP_LIST="$HOME/.config/wallpaper_list"
export XDG_CONFIG_HOME="$HOME/.config"
[ -n "$(ps -e | grep dwm)" ] || exec startx
