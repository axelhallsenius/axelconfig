#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --- Alias Zone --- #
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ins='sudo pacman -S'
alias upg='sudo pacman -Syu'

alias gim='git commit -m'

alias wf='sudo wifi-menu'

alias cap='scrot -u -d 2'

alias rstime='sudo ntpdate 0.arch.pool.ntp.org'

alias ts='./nonpac/ts/ts3client_runscript.sh'

alias tes='make -s test'

# --- /Alias Zone --- #

export VISUAL=vim
export EDITOR=vim
