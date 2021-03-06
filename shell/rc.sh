#!/bin/sh

source "$XDG_CONFIG_HOME/shell/env.sh"

[ -z "$PS1" ] && return

if [[ ! $(uname) == 'Darwin' ]]; then
    export LANG='en_US.UTF-8'
    export LC_COLLATE='C'
    export LC_TIME='en_DK.UTF-8'
fi

export HISTCONTROL=ignoreboth
export HISTSIZE=100000
SAVEHIST=100000

command -v dircolors 2>&1 >/dev/null && eval "$(dircolors -b $XDG_CONFIG_HOME/shell/dircolors)"
command -v gdircolors 2>&1 >/dev/null && eval "$(gdircolors -b $XDG_CONFIG_HOME/shell/dircolors)"
export LESS=-R
export LESS_TERMCAP_mb=$(printf "\e[1;31m")
export LESS_TERMCAP_md=$(printf "\e[1;31m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[1;44;33m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[1;32m")

export GPG_TTY=$(tty)

source "$XDG_CONFIG_HOME/shell/aliases.sh"

command -v rbenv 2>&1 >/dev/null && eval "$(rbenv init -)"
command -v pyenv 2>&1 >/dev/null && eval "$(pyenv init -)"
