# Set URL of the remote origin for Git repository
#
# Usage:
#     git-remote-set-url-origin URL

function git-remote-set-url-origin
  command git remote set-url origin $argv
end
