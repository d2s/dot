# Search Debian packages
#
# Usage:
#   apt-package-search KEYWORD

function apt-package-search
  command apt-cache search $argv
end
