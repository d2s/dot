# Git log history displayed with bat
#
# Usage:
#     git-log-bat

function git-log-bat
  command git log $argv | bat
end
