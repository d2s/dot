# file-management.zsh

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
# List directory contents faster
# (for extra details, look at `man ls` documentation)
alias l="ls"
alias ll="ls -hl"
alias la="ls -A"
alias lla="ls -lah"
alias l="ls -CF"
alias dir="ls -al"


# -----------------------------------------------------------
# Create directory path, change current path to it
# Usage:
#   mkcd something/epic
function mkcd(){
  mkdir -p "$1"
  cd "$1"
}


# -----------------------------------------------------------
# PATH management helpers
# -----------------------------------------------------------

# Print out more easily readable formatted paths
alias path='echo -e ${PATH//:/\\n}'


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
# File compression
# -----------------------------------------------------------

# -----------------------------------------------------------
# Uncompressing files

# `untar`
# Usage:
#   `untar filename.tar`
alias untar="tar xvf"

alias tar-extract-gz="tar -zxvf"
alias tar-compress-gz="tar -zcvf"


# -----------------------------------------------------------
# File fingerprints
# -----------------------------------------------------------
# Calculate sha1 of a file(s)
#
# Usage:
#   sha1 filename
#   sha1 *.md
# -----------------------------------------------------------
alias sha1='openssl sha1'
