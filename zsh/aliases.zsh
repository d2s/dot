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

if [ "$ZSH" ] ; then
  alias dotfiles="cd $ZSH"
fi

if [ "$PROJECTS" ] ; then
  alias projects="cd $PROJECTS"
  alias github="cd $PROJECTS/github.com"
  alias github-d2s="cd $PROJECTS/github.com/d2s"
fi


# -----------------------------------------------------------
# Location related aliases

# Copy name of current workind directory to clipboard
if [ "$SYSTEMTYPE" = "linux" ] ; then
  alias pwdcopy="pwd | xclip -selection clipboard"
elif [ "$OS" = "darwin" ] ; then
  alias pwdcopy="pwd | pbcopy"
fi

# -----------------------------------------------------------
# Lists folders and files sizes in the current folder
alias ducks="du -cksh * | sort -rn|head -11"


# -----------------------------------------------------------
# If `grep` is available
if type -p grep &>/dev/null; then
  # grep through history
  #
  # Usage:
  #   hf KEYWORD
  #
  function hf() {
    history | grep "$1"
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
# grep
# -----------------------------------------------------------
# Always enable colored `grep` output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# -----------------------------------------------------------
# GPG
# -----------------------------------------------------------
# If `gpg` is available
if type -p gpg &>/dev/null; then
  # List GPG secret keys from the local system
  # - https://help.github.com/en/articles/checking-for-existing-gpg-keys
  alias list-gpg-keys='gpg --list-secret-keys --keyid-format LONG'

  # Print the GPG key ID, in ASCII armor format
  #
  # Usage:
  #   list-export-gpg-key KEYID
  alias list-export-gpg-key='gpg --armor --export'
fi


# -----------------------------------------------------------
# Rust helpers
# -----------------------------------------------------------

# If `rustup` tool is available
if type -p rustup &>/dev/null; then
  alias update-rust="rustup update"
fi


# -----------------------------------------------------------
# bat
#
# "A cat(1) clone with syntax highlighting and Git integration. "
# - https://github.com/sharkdp/bat
# -----------------------------------------------------------

# If `bat` is available
if type -p bat &>/dev/null; then
  alias cat="bat"
fi


# -----------------------------------------------------------
# hub
# -----------------------------------------------------------

# If `hub` is available
if type -p hub &>/dev/null; then
  alias hc="hub clone"
  alias hcsub="hub clone --recurse-submodules"
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
# Yarn
# -----------------------------------------------------------

# If `yarn` is available
if type -p yarn &>/dev/null; then
  # List what (top level) packages are installed globally
  alias list-installed-yarn-global-packages="yarn global list --depth=0"

  # Update outdated globally installed npm packages
  alias update-yarn-global-packages="yarn global upgrade-interactive"
fi


# -----------------------------------------------------------
# brew helpers
# -----------------------------------------------------------

# List what (top level) packages are installed globally
alias list-installed-brew-packages="brew list"

# List what globally installed packages are outdated
alias list-outdated-brew-packages="brew update && brew outdated"

# Update outdated globally installed npm packages
alias update-brew-packages="brew update && brew upgrade"


# -----------------------------------------------------------
# Debian package management helpers
# -----------------------------------------------------------

if [ "$SYSTEMTYPE" = "linux" ] ; then
  # If `apt` is available
  if type -p apt &>/dev/null; then
    # Show Debian package details
    alias details="apt-cache show"
    # Show changelog for a Debian package
    alias changelog="apt changelog"
  fi
fi


# -----------------------------------------------------------
# zsh package management helpers
# - This updates zsh related tools
# -----------------------------------------------------------

update-zsh()
{
  printf "\\n Updating zsh plugins \\n"
  zplugin self-update
  zplugin update
}


# -----------------------------------------------------------
# Various tools
# -----------------------------------------------------------

if type -p telnet &>/dev/null; then
  # MapSCII "The whole world in your console"
  # - https://github.com/rastapasta/mapscii
  alias worldmap="telnet mapscii.me"
else
  if [ "$DEBUG" = "true" ] ; then
    alias worldmap='echo "NOTE: worldmap requires application: telnet"'
  fi
fi


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

if type -p curl &>/dev/null; then
  alias miip="curl -o- $IP_ECHO_SERVICE"
elif type -p wget &>/dev/null; then
  alias miip="wget -qO- $IP_ECHO_SERVICE"
else
  if [ "$DEBUG" = "true" ] ; then
    alias miip='echo "NOTE: miip requires either Curl or Wget to work."'
  fi
fi


# -----------------------------------------------------------
# Networking: port numbers

if type -p lsof &>/dev/null; then
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
# ip (IPROUTE2)
#
# - https://linux.die.net/man/8/ip
# - http://www.policyrouting.org/iproute2.doc.html
# -----------------------------------------------------------
# If `ip` is available
if type -p ip &>/dev/null; then
  # look at protocol addresses
  alias list-network-address="ip address show"

  # list multicast addresses
  alias list-network-multicast-address="ip maddress show"
fi


# -----------------------------------------------------------
# System information tools

if [ "$OS" = "darwin" ] ; then
  if [ -f /usr/sbin/system_profiler ]; then
    alias hardware-info="/usr/sbin/system_profiler SPHardwareDataType"
  fi
# else
  # alias hardware-info="" # TODO: Find similar tool
fi


# -----------------------------------------------------------
# List active processes

if [ "$OS" = "darwin" ] ; then
  alias top="top -o cpu"
# else
  # alias top="top"
fi

# -----------------------------------------------------------
if [ "$SYSTEMTYPE" = "linux" ] ; then
  # List all processes
  alias processes_all="ps -AFH"
else
  alias processes_all="ps -Afjv"
fi


# -----------------------------------------------------------
if [ "$SYSTEMTYPE" = "linux" ] ; then
  # Follow system log activity on a terminal window
  alias systail="sudo tail -f /var/log/syslog"
elif [ "$OS" = "darwin" ] ; then
  alias systail="tail -f /var/log/system.log"
fi


# -----------------------------------------------------------
# Snapcraft aliases

if [ "$SYSTEMTYPE" = "linux" ] ; then
  # echo "System is running Linux!"

  # Allow using different versions at the same time
  if [ -f /snap/bin/firefox ]; then
    alias latest-firefox="/snap/bin/firefox"
  fi
fi


# -----------------------------------------------------------
# Clipboard handling aliases similar to macOS commands

if [ "$SYSTEMTYPE" = "linux" ] ; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi


# -----------------------------------------------------------
# Calendar related aliases

# Get week number
alias week="date +%V"


# -----------------------------------------------------------
# File compression
# -----------------------------------------------------------

# -----------------------------------------------------------
# Uncompressing files

# `untar`
# Usage:
#   `untar filename.tar`
alias untar="tar xvf"


# -----------------------------------------------------------
# SSH Key management
# -----------------------------------------------------------

# Pipe my SSH public key to clipboard
if [ -f ~/.ssh/id_rsa.pub ]; then
  if [ "$SYSTEMTYPE" = "linux" ] ; then
    alias pubkey="more ~/.ssh/id_rsa.pub | xclip -selection clipboard | echo '=> SSH Public key copied to pasteboard.'"
  elif [ "$OS" = "darwin" ] ; then
    alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> SSH Public key copied to pasteboard.'"
  fi
fi

# Pipe my private key to clipboard
# alias prikey="more ~/.ssh/id_rsa | xclip -selection clipboard | echo '=> SSH Private key copied to pasteboard.'"


# -----------------------------------------------------------
# Docker aliases
# -----------------------------------------------------------
# If `docker` is available
if type -p docker &>/dev/null; then
  # look at protocol addresses
  # alias list-network-address="ip address show"

  # youtube-dl
  # - https://github.com/vimagick/dockerfiles/tree/master/youtube/youtube-dl
  #
  # Usage:
  # - list all formats:
  #   yt -F VIDEOID
  # - Download item:
  #   yt VIDEOID
  alias yt='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data vimagick/youtube-dl'
fi





