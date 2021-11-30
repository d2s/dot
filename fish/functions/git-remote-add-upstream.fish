# Add remote upstream for Git repository
#
# Usage:
#     git-remote-add-upstream URL

function git-remote-add-upstream
  command git remote add upstream $argv
end
