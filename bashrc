#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias update='sudo pacman -Syyu && yt-dlp -U'
alias ll='ls -a -- color=auto'
alias music='yt-dlp -x -f ba/b --audio-quality 0 --audio-format flac --add-metadata --embed-thumbnail -o ~/Music/%"(title)s.%(ext)"s'
alias audio='yt-dlp -x -f ba/b --audio-quality 0 --audio-format flac'
alias tips='echo Write ISO to USB: sudo dd if=/path/to/iso/file.iso of=/dev/sdX status=progress'
PS1='[\u@\h \W]\$ '
