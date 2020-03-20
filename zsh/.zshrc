# I don't use zsh anymore. This config is final.


# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zshhist
HISTSIZE=16
SAVEHIST=0
setopt nomatch
unsetopt appendhistory autocd beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install

# completion

zstyle ':completion:*' completer _complete _ignored _approximate
# zstyle ':completion:*' max-errors 2
zstyle ':completion:*' prompt 'Did you mean '
zstyle :compinstall filename '/home/peter/.zshrc'

autoload -Uz compinit
compinit

# env
# adapt these for your preference

export EDITOR="/usr/bin/nvim"
export PAGER="/usr/bin/less"
export BROWSER="firefox"

export XDG_CONFIG_HOME="$HOME/.config"

# alias

alias ezsh="$EDITOR $HOME/.zshrc"
alias evim="$EDITOR $HOME/.config/nvim/init.vim"
alias evimt="$EDITOR $HOME/.config/nvim/colors/acretercolor.vim"
alias efstab="sudo $EDITOR /etc/fstab"
alias ebsp="$EDITOR $HOME/.config/bspwm/bspwmrc"
alias esxhkd="$EDITOR $HOME/.config/sxhkd/sxhkdrc"

# theme

autoload -Uz colors
colors

## prompt
setopt prompt_subst

### for start and end of a prompt section
PROMPT_START="%u%{$fg[red]%}%B[%{$reset_color%}%b"
PROMPT_END="%u%{$fg[red]%}%B]%{$reset_color%}%b"

### sections
PROMPT_PWD="$PROMPT_START%B%{$fg[white]%}%(4~|%-1~/.../%2~|%~)%{$reset_color%}%b$PROMPT_END"
PROMPT_USER="$PROMPT_START%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M%{$reset_color%}%b$PROMPT_END"
PROMPT_ACTUAL="%B%{$fg[magenta]%}%#%{$reset_color%}%b"

### show vi mode
function zle-line-init zle-keymap-select {
	PROMPT_MODE="$PROMPT_START%B${${KEYMAP/vicmd/NORMAL}/(main|viins)/INSERT}%b$PROMPT_END"
	PROMPT="$PROMPT_USER $PROMPT_PWD $PROMPT_MODE
$PROMPT_ACTUAL "
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

## print greeting
echo -e This is $HOSTNAME running on $(uname -sr) at $(date "+%H:%M").

# color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r
