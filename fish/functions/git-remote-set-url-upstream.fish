# Set URL of the remote upstream for Git repository
#
# Usage:
#     git-remote-set-url-upstream URL

function git-remote-set-url-upstream
  command git remote set-url upstream $argv
end
