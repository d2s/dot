# Print out Git config details for all keys,
# including from imported local configuration files.
#
# Usage example:
#     git-config-show-all

function git-config-show-all
  command git config --global --includes -l
end
