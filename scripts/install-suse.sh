#!/usr/bin/env bash
###############################################################################
# install-apt-packages.sh
# This script installs tools from openSUSE packages
###############################################################################
#
# More details about openSUSE package management:
# - https://en.opensuse.org/Package_management
# - https://en.opensuse.org/Package_repositories
# - https://en.opensuse.org/Portal:Zypper
# - https://en.opensuse.org/SDB:Zypper_usage
# - https://en.opensuse.org/SDB:Zypper_manual
#
#
# -----------------------------------------------------------
# Unoffical Bash "strict mode"
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\t\n' # Stricter IFS settings
# shellcheck disable=SC2034  # Unused variable needed for the Bash strict mode
ORIGINAL_IFS=$IFS

# -----------------------------------------------------------
# Go to user account's home directory
cd "$HOME"

# -----------------------------------------------------------
# Update openSUSE package lists
# Usage:
#   opensuse_package_list_update
opensuse_package_list_update() {
  printf "\\n"
  printf "Updating OpenSUSE package lists:"
  printf "\\n"
  sudo zypper refresh
  printf "\\n"
}

# -----------------------------------------------------------
# Update previously installed packages to latest versions
# Usage:
#   update_opensuse_packages
update_opensuse_packages() {
  printf "\\n"
  printf "Updating all existing packages:"
  printf "\\n"
  sudo zypper up
  printf "\\n"
}

# -----------------------------------------------------------
# Install openSUSE package defined in string variable
# Usage:
#   install_opensuse_package "package"
install_opensuse_package() {
  printf "\\n"
  printf "sudo zypper in %s\\n" "$1"
  sudo zypper in "$1"
  printf "\\n\\n"
}

# -----------------------------------------------------------
# Tell user that package has already been installed
# Usage:
#   opensuse_package_already_installed "package"
opensuse_package_already_installed() {
  printf "NOTE: openSUSE package already installed: %s\\n" "$1"
  printf "\\n"
}

# -----------------------------------------------------------
# If package is not already installed, install it
# Usage:
#   if_not_already_installed "package"
if_not_already_installed() {
  INSTALL_COMPARISON_PATTERN="Installed      : Yes"
  if [[ ! "$(zypper info "$1" |grep "$INSTALL_COMPARISON_PATTERN")" == "$INSTALL_COMPARISON_PATTERN" ]]; then
    install_opensuse_package "$1"
  else
    opensuse_package_already_installed "$1"
  fi
}

# -----------------------------------------------------------
# If `zypper` is available
if [ -x "$(command -v zypper)" ]; then
  opensuse_package_list_update

  install_opensuse_package "git"
  install_opensuse_package "curl"
  install_opensuse_package "zsh"
  install_opensuse_package "ShellCheck"
  install_opensuse_package "whois"
  install_opensuse_package "ack"
else
  # Exit with error code when zypper is not available
  echo "NOTE: zypper is not available! Nothing happened."
  exit 1
fi
