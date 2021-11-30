# List contributors with number of commits
#
# Usage:
#   git-contributors

function git-contributors
  command git shortlog --summary --numbered
end
