# Show Debian package details
#
# Usage:
#   apt-package-details KEYWORD

function apt-package-details -d "Show package details"
  command apt-cache show $argv
end
