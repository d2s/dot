#!/bin/zsh

# -----------------------------------------------------------
# Count files or directories in directory
# - https://github.com/dylanaraps/pure-bash-bible#count-files-or-directories-in-directory
# -----------------------------------------------------------
count() {
  # Usage: count /path/to/dir/*
  #        count /path/to/dir/*/
  printf '%s\n' "$#"
}


# -----------------------------------------------------------
# Check if string contains a sub-string
# if [[ "$OSTYPE" == *linux* ]]; then
#   printf '%s\n' "linux sub string is in var."
# fi


# -----------------------------------------------------------
# Get the list of functions in a script
get_functions() {
  # Usage: get_functions
  IFS=$'\n' read -d "" -ra functions < <(declare -F)
  printf '%s\n' "${functions[@]//declare -f }"
}



# -----------------------------------------------------------
# Check if a program is in the user's PATH
# if type -p firefox &>/dev/null; then
#   # Program is in PATH.
#   echo "Firefox is available from the command line."
# fi
