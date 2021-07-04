#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1=' \[\e[0;1;33m\]\W \[\e[0;1;33m\]> \[\e[0m\]'

alias rsscrot=".utils/rsscrot/screenshot.sh"
alias rsupdate=".utils/rsupdate/rsupdate.sh"
alias pfetch=".utils/pfetch/pfetch"
alias doom=".emacs.d/bin/doom"
