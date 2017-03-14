#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --- Alias Zone --- #
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ll='ls -l'

alias install='sudo pacman -S'
alias upgrade='sudo pacman -Syyu'

alias wifi='sudo wifi-menu'

alias capture='scrot -u -d 2'

alias rstime='sudo ntpdate 0.arch.pool.ntp.org'


# --- /Alias Zone --- #

export VISUAL=vim
export EDITOR=vim

# Makes less cozier
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
