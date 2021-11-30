# Show changelog of a Debian package
#
# Usage:
#   apt-package-changelog KEYWORD

function apt-package-changelog
  command apt changelog $argv
end
