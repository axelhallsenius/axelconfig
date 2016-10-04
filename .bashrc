#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ins='sudo pacman -S'
alias upg='sudo pacman -Syu'

alias gim='git commit -m'

alias wf='sudo wifi-menu'

alias ts='./nonpac/ts/ts3client_runscript.sh'

export VISUAL=vim
export EDITOR=vim


#export LANG='en_US.UTF-8'
#export LC_ALL='en_US.UTF-8'

#Powerline
                                        
                                        
#function _update_ps1() {
#    PS1="$(~/powerline-shell.py $? 2> /dev/null)"
#}
#
#if [ "$TERM" != "linux" ]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi
