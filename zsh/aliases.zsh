#!/bin/zsh

# -----------------------------------------------------------
# List directory contents faster
# (for extra details, look at `man ls` documentation)
alias l="ls"
alias ll="ls -hl"
alias la='ls -A'
alias lla='ls -lah'
alias l='ls -CF'


# -----------------------------------------------------------
# Jump to favorite locations
alias dotfiles="cd $ZSH"
alias projects="cd $PROJECTS"


# -----------------------------------------------------------
# Copy name of current workind directory to clipboard (Mac OS X)
if [ -f /usr/bin/pbcopy ]; then
  alias pwdcopy="pwd | pbcopy"
fi

# -----------------------------------------------------------
# Lists folders and files sizes in the current folder
alias ducks='du -cksh * | sort -rn|head -11'



# -----------------------------------------------------------
# grep through history
function hf() {
  history | grep $1
}



# -----------------------------------------------------------
# Avoid making mistakes
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'


# -----------------------------------------------------------
# c = clear the terminal window
alias c='clear'


# -----------------------------------------------------------
# Networking toolkit

# Shows my public ip
# (Requires curl)
alias miip='curl -o- https://secure.informaction.com/ipecho/'

# List open ports on your machine (Mac OS X)
alias openholes='sudo lsof -i -P | grep -i "listen"'



# SSH public key copied to clipboard
if [ -f ~/.ssh/id_rsa.pub ]; then
  alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to clipboard.'"
fi



# -----------------------------------------------------------
# Show system information (Mac OS X)
if [ -f /usr/sbin/system_profiler ]; then
  alias hardware-info='/usr/sbin/system_profiler SPHardwareDataType'
fi


# -----------------------------------------------------------
# List active processes (OS X)
alias top='top -o cpu'


# List all processes
if [ "$OS" = "linux" ] ; then
  alias processes_all='ps -AFH'
else
  alias processes_all='ps -Afjv'
fi


# -----------------------------------------------------------
# Follow system log activity on a terminal window
if [ "$OS" = "linux" ] ; then
  alias systail='tail -f /var/log/syslog'
else
  alias systail='tail -f /var/log/system.log'
fi
