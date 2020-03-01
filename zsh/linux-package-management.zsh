# -----------------------------------------------------------
# openSUSE package management helpers
# -----------------------------------------------------------

if [[ "$DISTRIBUTION" == "openSUSE" ]]; then
  # If `zypper` is available
  if type -p zypper &>/dev/null; then
    # -----------------------------------------------------------
    # Install openSUSE package defined in string variable
    # Usage:
    #   install-opensuse-package "package"
    install-opensuse-package() {
      printf "\\n"
      printf "sudo zypper in %s\\n" "$1"
      sudo zypper in "$1"
      printf "\\n\\n"
    }

    # Show openSUSE package details
    alias details="zypper info"

    # Show the full changelog for a RPM-based openSUSE package
    alias changelog="rpm -q --changelog"
  fi
fi


# -----------------------------------------------------------
# Debian package management helpers
# -----------------------------------------------------------

if [[ "$DISTRIBUTION" == "Debian" ]]; then
  # If `apt` is available
  if type -p apt &>/dev/null; then
    # Show Debian package details
    alias details="apt-cache show"

    # Show changelog for a Debian package
    alias changelog="apt changelog"
  fi
fi


# -----------------------------------------------------------
# Snapcraft
# - https://snapcraft.io/
# -----------------------------------------------------------
if [ -d "/snap/bin" ]; then
  # Add custom binaries from Snapcraft to the PATH
  export PATH="$PATH:/snap/bin"
  # export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/snapd/desktop"

  # Allow using different versions at the same time
  if [ -f "/snap/bin/firefox" ]; then
    alias latest-firefox="/snap/bin/firefox"
  fi
fi
