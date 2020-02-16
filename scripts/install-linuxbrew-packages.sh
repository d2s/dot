#!/usr/bin/env bash
#############################################################
# install-linuxbrew-packages.sh
# This script installs tools from Linux version of Homebrew
#############################################################

# -----------------------------------------------------------
# Unoffical Bash "strict mode"
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
# -----------------------------------------------------------
set -euo pipefail
IFS=$'\t\n' # Stricter IFS settings
# shellcheck disable=SC2034  # Unused variable needed for the Bash strict mode
ORIGINAL_IFS=$IFS

# -----------------------------------------------------------
# Go to user account's home directory
# -----------------------------------------------------------
cd "$HOME"

# -----------------------------------------------------------
# Update apt package lists
# Usage:
#   brew_update
# -----------------------------------------------------------
brew_update() {
  printf "\\n"
  printf "Updating Homebrew package lists:"
  printf "\\n"
  brew update
  printf "\\n"
}

# -----------------------------------------------------------
# Install package defined in a string variable
# Usage:
#   install_brew_package "package"
# -----------------------------------------------------------
install_brew_package() {
  printf "\\n"
  printf "brew install %s\\n" "$1"
  brew install "$1"
  printf "\\n\\n"
}

# -----------------------------------------------------------
# Tell user that package has already been installed
# Usage:
#   brew_package_already_installed "package"
# -----------------------------------------------------------
brew_package_already_installed() {
  printf "NOTE: package already installed: %s\\n" "$1"
  printf "\\n"
}

# -----------------------------------------------------------
# If package is not already installed, install it
# Usage:
#   if_not_already_installed "package"
# -----------------------------------------------------------
if_not_already_installed() {
  if [[ ! "$(brew list |grep "$1")" == "$1" ]]; then
    install_brew_package "$1"
  else
    brew_package_already_installed "$1"
  fi
}

# -----------------------------------------------------------
# If `brew` command is available
# -----------------------------------------------------------
if [ -x "$(command -v brew)" ]; then
  brew_update

  if_not_already_installed "hub"
  if_not_already_installed "youtube-dl"

else
  echo ""
  echo "NOTE: brew is not available! Nothing happened."
  echo "You need to have Homebrew installed (before installing other tools with it)."
  echo "Read more from the website:"
  echo "- https://docs.brew.sh/Homebrew-on-Linux"
  echo "- https://brew.sh/"
  echo ""
fi
