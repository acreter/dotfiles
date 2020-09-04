# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
#set -o vi

alias ls='ls -h --color=auto --group-directories-first'
alias cr='quickrepo'
alias vim='nvim'
alias ebash='$EDITOR $HOME/.bashrc'
alias ebashp='$EDITOR $HOME/.bash_profile'
alias evim='$EDITOR $HOME/.config/nvim/init.vim'
alias yda='youtube-dl -x -f bestaudio/best'
alias query-wallpaper='"$IMAGE" -t $(cat "$WP_LIST")'

alias xi='sudo xbps-install'
alias xr='sudo xbps-remove'
alias xq='xbps-query'

alias gd='git diff'
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
	cd $(find $REPOS -type d -name "*$1*" | sed 1q)
}

man() {
    LESS_TERMCAP_md=$'\e[01;31m'\
    LESS_TERMCAP_me=$'\e[0m'\
    LESS_TERMCAP_us=$'\e[01;32m'\
    LESS_TERMCAP_ue=$'\e[0m'\
    LESS_TERMCAP_so=$'\e[45;93m'\
    LESS_TERMCAP_se=$'\e[0m'\
    /usr/bin/man "$@"
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

export SHELL_LOGIN_TIME=$(date "+%H:%M")

# print greeting
clear
echo -e This is $(colorfg 1 "$HOSTNAME") running on $(colorfg 1 "$(uname -sr)") at$(colorfg 1 " $SHELL_LOGIN_TIME").

PS1="$(colorfg 1 [)\u$(colorfg 2 @)\h$(colorfg 1 ]) $(colorfg 1 [)\w$(colorfg 1 ])$SSH_PROMPT\n$(colorfg 5 %) "
