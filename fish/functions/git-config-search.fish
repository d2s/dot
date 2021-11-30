# Search from the git configs
#
# Usage:
#     git-config-search PATTERN

function git-config-search
  command git config --global --includes -l |grep $argv
end
