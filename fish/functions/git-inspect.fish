# Show when lines in a file were changed
#
# Usage:
#   git-inspect FILENAME

function git-inspect
  command git blame $argv
end
