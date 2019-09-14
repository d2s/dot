#!/bin/bash -
###############################################################################
# install-linuxbrew-packages.sh
# This script installs tools from apt packages if possible
###############################################################################

# -----------------------------------------------------------
# Unoffical Bash "strict mode"
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\t\n' # Stricter IFS settings
ORIGINAL_IFS=$IFS

# -----------------------------------------------------------
# Go to user account's home directory
cd "$HOME"

# -----------------------------------------------------------
# Commonly used text strings for the script
NOTE_LINUXBREW_INSTALL="brew install:"
NOTE_COMMAND_EXISTS_ALREADY="NOTE: already installed:"

# -----------------------------------------------------------
# TODO: Make a wrapper function that improves the installation process consistency
# LINUXBREW_COMMAND_FOR_INSTALLING="$(brew install)"

# -----------------------------------------------------------
# If `brew` command is available
if [ -x "$(command -v brew)" ]; then

  # -----------------------------------------------------------
  # `youtube-dl`
  # What is the package name for the application?
  LINUXBREW_PACKAGES_YT="youtube-dl"

  # If CLI command is not already existing
  if [ ! -x "$(command -v $LINUXBREW_PACKAGES_YT)" ]; then
    # Install related npm packages to get the application
    echo "$NOTE_LINUXBREW_INSTALL $LINUXBREW_PACKAGES_YT"
    brew install $LINUXBREW_PACKAGES_YT
  else
    echo "$NOTE_COMMAND_EXISTS_ALREADY $LINUXBREW_PACKAGES_YT"
  fi

  # -----------------------------------------------------------
  # ...

else
  echo ""
  echo "NOTE: brew is not available! Nothing happened."
  echo "You need to have Homebrew installed (before installing other tools with it)."
  echo "Read more from the website:"
  echo "- https://docs.brew.sh/Homebrew-on-Linux"
  echo "- https://brew.sh/"
  echo ""
fi
