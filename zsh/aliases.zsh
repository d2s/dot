#!/bin/zsh

# -----------------------------------------------------------
# List directory contents faster
# (for extra details, look at `man ls` documentation)
alias l="ls"
alias ll="ls -hl"
alias la="ls -A"
alias lla="ls -lah"
alias l="ls -CF"
alias dir="ls -al"


# -----------------------------------------------------------
# Jump to favorite locations
# -----------------------------------------------------------

if [ $ZSH ] ; then
  alias dotfiles="cd $ZSH"
fi

if [ $PROJECTS ] ; then
  alias projects="cd $PROJECTS"
fi


# -----------------------------------------------------------
# Location related aliases

if [ "$OS" = "darwin" ] ; then
  # Copy name of current workind directory to clipboard
  alias pwdcopy="pwd | pbcopy"
fi

# -----------------------------------------------------------
# Lists folders and files sizes in the current folder
alias ducks="du -cksh * | sort -rn|head -11"



# -----------------------------------------------------------
if [ "$(command -v grep)" ]; then
  # grep through history
  #
  # Usage:
  #   hf KEYWORD
  #
  function hf() {
    history | grep $1
  }
fi


# -----------------------------------------------------------
# Avoid making mistakes
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"


# -----------------------------------------------------------
# c = clear the terminal window
alias c="clear"


# -----------------------------------------------------------
# Antigen helpers
# -----------------------------------------------------------

alias update_antigen="antigen update"



# -----------------------------------------------------------
# Rust helpers
# -----------------------------------------------------------

# If `rustup` tool is available
if [ "$(command -v rustup)" ]; then
  alias update_rust="rustup update"
fi


# -----------------------------------------------------------
# bat
#
# "A cat(1) clone with syntax highlighting and Git integration. "
# - https://github.com/sharkdp/bat
# -----------------------------------------------------------

# If `bat` is available
if [ "$(command -v bat)" ]; then
  alias cat="bat"
fi



# -----------------------------------------------------------
# npm helpers
# -----------------------------------------------------------

# List what (top level) packages are installed globally
alias list-installed-npm-packages="npm ls -g --depth=0."

# List what globally installed packages are outdated
alias list-outdated-npm-packages="npm outdated -g --depth=0."

# Update outdated globally installed npm packages
alias update-npm-packages="npm update -g"


# -----------------------------------------------------------
# brew helpers
# -----------------------------------------------------------

# List what (top level) packages are installed globally
alias list-installed-brew-packages="brew list"

# List what globally installed packages are outdated
alias list-outdated-brew-packages="brew outdated"

# Update outdated globally installed npm packages
alias update-brew-packages="brew update && brew upgrade"



# -----------------------------------------------------------
# PATH management helpers
# -----------------------------------------------------------

# Print out more easily readable formatted paths
alias path='echo -e ${PATH//:/\\n}'


# -----------------------------------------------------------
# Networking toolkit
# -----------------------------------------------------------

# -----------------------------------------------------------
# Shows my public IP address

export IP_ECHO_SERVICE="https://api.ipify.org/"

if [ -x "$(command -v curl)" ]; then
  alias miip="curl -o- $IP_ECHO_SERVICE"
elif [ -x "$(command -v wget)" ]; then
  alias miip="wget -qO- $IP_ECHO_SERVICE"
else
  if [ $DEBUG = "true" ] ; then
    echo "miip requires either Curl or Wget to work."
  fi
fi


# -----------------------------------------------------------
# Networking: port numbers

if [ -x "$(command -v lsof)" ]; then
  # Find what application is using a port
  #
  # Usage:
  #   findportuser NUMBER
  #
  findportuser() {
    lsof -i :"$1"
  }

  if [ "$OS" = "darwin" ] ; then
    # List open ports on your machine
    alias openports='sudo lsof -i -P | grep -i "listen"'
  fi
fi


# -----------------------------------------------------------
# SSH public key to clipboard
if [ -f ~/.ssh/id_rsa.pub ]; then
  if [ "$OS" = "darwin" ] ; then
    alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to clipboard.'"
  fi
  # TODO: Find similar command for other systems.
fi



# -----------------------------------------------------------
# System information tools

if [ "$OS" = "darwin" ] ; then
  if [ -f /usr/sbin/system_profiler ]; then
    alias hardware-info="/usr/sbin/system_profiler SPHardwareDataType"
  fi
else
  # alias hardware-info="" # TODO: Find similar tool
fi


# -----------------------------------------------------------
# List active processes

if [ "$OS" = "darwin" ] ; then
  alias top="top -o cpu"
else
  # alias top="top"
fi

# -----------------------------------------------------------
# List all processes
if [ "$OS" = "linux" ] ; then
  alias processes_all="ps -AFH"
else
  alias processes_all="ps -Afjv"
fi


# -----------------------------------------------------------
# Follow system log activity on a terminal window
if [ "$OS" = "linux" ] ; then
  alias systail="tail -f /var/log/syslog"
elif [ "$OS" = "darwin" ] ; then
  alias systail="tail -f /var/log/system.log"
fi


# -----------------------------------------------------------
# Snapcraft aliases

if [ "$OS" = "linux" ] ; then
  # Allow using different versions at the same time
  if [ -f /snap/bin/firefox ]; then
    alias latest-firefox="/snap/bin/firefox"
  fi
fi



# -----------------------------------------------------------
# Docker aliases
# -----------------------------------------------------------

# youtube-dl
# - https://github.com/vimagick/dockerfiles/tree/master/youtube/youtube-dl
#
# Usage:
# - list all formats:
#   yt -F VIDEOID
# - Download item:
#   yt VIDEOID
alias yt='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data vimagick/youtube-dl'





