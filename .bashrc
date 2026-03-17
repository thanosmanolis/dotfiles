#
# ~/.bashrc
#

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
MAGENTA="\[\033[0;35m\]"
WHITE="\[\033[0;37m\]"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Execute fastfetch
fastfetch --logo ~/.config/fastfetch/logos/anarchy.txt
#fastfetch
# Set favourite editor
export EDITOR="vim"
export VISUAL="vim"

# Erase duplicates on history
export HISTCONTROL=erasedups

# Shortcuts
stty werase ^H 	#Erase whole word with ctrl+Backspace

# See last upgraded/installed packages
last_installed() {
    if [ -z "$1" ]; then
        grep "installed" /var/log/pacman.log
    else
        grep "installed" /var/log/pacman.log | tail -$1
    fi
}

last_upgraded() {
    if [ -z "$1" ]; then
        grep "upgraded" /var/log/pacman.log
    else
        grep "upgraded" /var/log/pacman.log | tail -$1
    fi
}

# Git command autocompletion
source /usr/share/git/completion/git-prompt.sh

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="$GREEN\u$RED-$BLUE\h$YELLOW\w\[\033[m\]$MAGENTA\$(__git_ps1)$WHITE \$ "
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# ------ Alias -------------------------------------------------------
# See if app needs "class" or "app_id" in sway config
alias is_appid="swaymsg -t get_tree | grep app_id"

# Alias for ssh, so that it works with kitty terminal
alias ssh="kitty +kitten ssh"

# Apps alias
alias stremio="flatpak run com.stremio.Stremio"
alias teams="teams-for-linux --enable-features=WebRTCPipeWireCapturer"
alias weasis="~/.local/bin/weasis"

# Update dotfiles
alias update_dotfiles="~/.config/scripts/update_dotfiles.sh"
