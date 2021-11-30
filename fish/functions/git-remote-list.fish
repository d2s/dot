# List Git remotes
#
# Usage:
#     git-remote-list

function git-remote-list
  command git remote -v $argv
end
