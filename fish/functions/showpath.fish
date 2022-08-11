# Show current terminal environment paths
#
# Usage:
#     showpath

function showpath
  echo $PATH | tr : "\n"
end
