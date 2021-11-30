# Print out Git config details for specified key,
# including imported local configuration files.
#
# Usage example:
#     git-config-show-key user.email

function git-config-show-key
  command git config --global --includes $argv
end
