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
  zinit self-update
  zinit update
}

# -----------------------------------------------------------
# Calendar related aliases

# Get week number
alias week="date +%V"


# -----------------------------------------------------------
# c = clear the terminal window
# alias c="clear"
