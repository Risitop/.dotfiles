#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Simple prompt
PS1=' \[\e[0;1;33m\]\W \[\e[0;1;33m\]> \[\e[0m\]'

# Custom scripts aliases
alias rsscrot="/home/risitop/.utils/rsscrot/screenshot.sh"
alias rsupdate="/home/risitop/.utils/rsupdate/rsupdate.sh"
alias pfetch="/home/risitop/.utils/pfetch/pfetch"
alias doom="/home/risitop/.emacs.d/bin/doom"
alias setupcfg="/home/risitop/.dotfiles/setup.sh"

# Pacman aliases
alias pacsyu="sudo pacman -Syyu"
alias pacsyy="sudo pacman -Syy --noconfirm"

# ls -> exa
alias ls='exa -al --color=always --group-directories-first'
