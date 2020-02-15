#!/bin/zsh

# -----------------------------------------------------------
# Local system-specific config file for Zsh
#   NOTE: Outside of the Git repository!
# -----------------------------------------------------------
LOCALRC_CONFIG_FILE="$HOME/.localrc.sh"

if [[ -f "$LOCALRC_CONFIG_FILE" ]]; then
  alias edit_localrc_config="code $LOCALRC_CONFIG_FILE"
fi


# -----------------------------------------------------------
# Lists folders and files sizes in the current folder
alias ducks="du -cksh * | sort -rn|head -11"

# Available space from disk partitions listed in a readable way
alias disk-free-space="df -h"

# Disk space used by the file/directory given as a parameter
alias disk-usage-summary="du -sh"


# -----------------------------------------------------------
# Avoid making mistakes
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"


# -----------------------------------------------------------
# Show amount of memory usage in megabytes
alias free="free -m"


# -----------------------------------------------------------
# Calculate sha1 of a file(s)
# Usage:
#   sha1 filename
#   sha1 *.md
alias sha1='openssl sha1'


# -----------------------------------------------------------
# Environmental variables
alias showenv="env | sort"
alias showpath='echo $PATH | tr : "\n"'


# -----------------------------------------------------------
# zsh package management helpers
# - This updates zsh related tools
# -----------------------------------------------------------

update-zsh() {
  printf "\\n Updating zsh plugins \\n"
  zplugin self-update
  zplugin update
}


# -----------------------------------------------------------
if [ "$SYSTEMTYPE" = "linux" ] ; then
  # Follow system log activity on a terminal window
  alias systail="sudo tail -f /var/log/syslog"
elif [ "$OS" = "darwin" ] ; then
  alias systail="tail -f /var/log/system.log"
fi


# -----------------------------------------------------------
# Calendar related aliases

# Get week number
alias week="date +%V"


# -----------------------------------------------------------
# c = clear the terminal window
# alias c="clear"
