#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Execute neofetch
neofetch

# Set favourite editor
export EDITOR="vim"
export VISUAL="vim"

# Erase duplicates on history
export HISTCONTROL=erasedups

# Shortcuts
stty werase ^H 	#Erase whole word with ctrl+Backspace

# ESP8266 environment variables
export PATH=$HOME/esp/xtensa-esp8266-elf/bin:$PATH
export ESP8266_RTOS_SDK_DIR=$HOME/esp/ESP8266_RTOS_SDK 

# ESP32 environment variables
export PATH=$PATH:$HOME/esp/xtensa-esp32-elf/bin
export ESP32_SDK_DIR=$HOME/esp/esp-idf

# Alias for emqx
alias emqx='/home/manolee/emqx-rel/_build/emqx/rel/emqx/bin/emqx'
alias emqx_ctl='/home/manolee/emqx-rel/_build/emqx/rel/emqx/bin/emqx_ctl'
alias emqx_conf='cd /home/manolee/emqx-rel/_build/emqx/rel/emqx/etc'

# Alias for emqx-3.4.3
alias emqx3='/home/manolee/emqx-3.4.3/_build/emqx/rel/emqx/bin/emqx'
alias emqx3_ctl='/home/manolee/emqx-3.4.3/_build/emqx/rel/emqx/bin/emqx_ctl'
alias emqx3_conf='cd /home/manolee/emqx-3.4.3/_build/emqx/rel/emqx/etc'

# See last upgraded/installed packages
alias last_upgraded='grep -i upgraded /var/log/pacman.log'
alias last_installed='grep -i installed /var/log/pacman.log'

# Alias for ssh, so that it works with kitty terminal
alias ssh="kitty +kitten ssh"
