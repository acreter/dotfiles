# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=/usr/bin/nvim
export PAGER=less
export HISTTIMEFORMAT="%d.%m.%y %T "

alias ls='ls --color=auto'
alias vim='nvim'
alias ebash='$EDITOR $HOME/.bashrc'
alias qpdf='pdftotext -layout -eol unix -fixed 4 '

# read pdf on tty. requires poppler
pdftty() {
	[ -z "$1" ] && return
	pdftotext -q "$1" - 2>&1 > /dev/null && pdftotext -layout -eol unix "$1" - | $PAGER
}

# prompt
colorreset() {
	echo "\e[m"
}

colorfg() {
	echo "$(tput setaf $1)$2\e[m"
}

colorbg() {
	echo "$(tput setab $1)$2$(colorreset)"
}

[ -z $SSH_CLIENT ] || SSH_PROMPT=" $(colorbg 1 ' SSH ')"

PS1="$(colorfg 1 [)\u$(colorfg 2 @)\h$(colorfg 1 ]) $(colorfg 1 [)\w$(colorfg 1 ])$SSH_PROMPT\n$(colorfg 5 %) "

export SHELL_LOGIN_TIME=$(date "+%H:%M")

# print greeting
clear
echo -e "This is $(colorfg 1 $HOSTNAME) running on $(colorfg 1 $(uname -sr)) at $(colorfg 1 $SHELL_LOGIN_TIME)."
