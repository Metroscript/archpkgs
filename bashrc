#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias update='sudo pacman -Syyu'
alias ll='ls -A'
alias ytaudio='yt-dlp -x -f bestaudio[ext=m4a] --add-metadata --embed-thumbnail'
alias audio='yt-dlp -x -f bestaudio[ext=mp3] --add-metadata --embed-thumbnail'
alias cleanup='sudo pacman -Sc
PS1='[\u@\h \W]\$ '
