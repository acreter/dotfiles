# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=/usr/bin/nvim
export PAGER=/usr/bin/less
export PDFREADER=/usr/bin/zathura
export HISTTIMEFORMAT="%d.%m.%y %T "
export REPOS="$HOME/repos"

export MENUCONFIG_COLOR="blackbg"

alias ls='ls -h --color=auto --group-directories-first'
alias cr='quickrepo'
alias vim='nvim'
alias ebash='$EDITOR $HOME/.bashrc'
alias evim='$EDITOR $HOME/.config/nvim/init.vim'

alias xi='sudo xbps-install'
alias xr='sudo xbps-remove'
alias xq='xbps-query'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gf='git fetch'
alias gm='git merge'
alias gpull='git pull'
alias gpush='git push'

alias sbash='source $HOME/.bashrc'

# read pdf on tty. requires poppler
pdftty() {
	[ -z "$1" ] && return
	pdftotext -q "$1" - 2>&1 > /dev/null && pdftotext -layout -eol unix "$1" - | $PAGER
}

# quick cd to a repo
quickrepo() {
	[ -z "$1" ] && return
	cd $(find $REPOS -type d -name "$1" | sed 1q)
}


# prompt
colorreset() {
	echo -e "\001\e[m\002"
}

colorfg() {
	echo -e "\001$(tput setaf $1)\002$2$(colorreset)"
}

colorbg() {
	echo -e "\001$(tput setab $1)\002$2$(colorreset)"
}

[ -z $SSH_CLIENT ] || SSH_PROMPT=" $(colorbg 1 ' SSH ')"

PS1="$(colorfg 1 [)\u$(colorfg 2 @)\h$(colorfg 1 ]) $(colorfg 1 [)\w$(colorfg 1 ])$SSH_PROMPT\n$(colorfg 5 %) "

export SHELL_LOGIN_TIME=$(date "+%H:%M")

# print greeting
clear
echo -e This is $(colorfg 1 "$HOSTNAME") running on $(colorfg 1 "$(uname -sr)") at$(colorfg 1 " $SHELL_LOGIN_TIME").
