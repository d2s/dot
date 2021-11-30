# Add remote origin for Git repository
#
# Usage:
#     git-remote-add-origin URL

function git-remote-add-origin
  command git remote add origin $argv
end

