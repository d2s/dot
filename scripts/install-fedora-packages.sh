#!/usr/bin/env bash
#############################################################
# install-fedora-packages.sh
# This script installs tools from Fedora packages
#############################################################
#
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
# Update Fedora package lists
# Usage:
#   fedora_package_list_update
# -----------------------------------------------------------
fedora_package_list_update() {
  printf "\\n"
  printf "Updating Fedora package lists:"
  printf "\\n"
  sudo dnf makecache
  printf "\\n"
}

# -----------------------------------------------------------
# Update previously installed packages to latest versions
# Usage:
#   update_fedora_packages
# -----------------------------------------------------------
update_fedora_packages() {
  printf "\\n"
  printf "Updating all existing packages:"
  printf "\\n"
  sudo dnf update
  printf "\\n"
}

# -----------------------------------------------------------
# Install Fedora package defined in string variable
# Usage:
#   install_fedora_package "package"
# -----------------------------------------------------------
install_fedora_package() {
  printf "\\n"
  printf "sudo dnf install %s\\n" "$1"
  sudo dnf install "$1"
  printf "\\n\\n"
}

# -----------------------------------------------------------
# Tell user that package has already been installed
# Usage:
#   fedora_package_already_installed "package"
# -----------------------------------------------------------
fedora_package_already_installed() {
  printf "NOTE: Fedora package already installed: %s\\n" "$1"
  printf "\\n"
}

# -----------------------------------------------------------
# If package is not already installed, install it
# Usage:
#   if_not_already_installed "package"
# -----------------------------------------------------------
if_not_already_installed() {
  INSTALL_COMPARISON_PATTERN="package $1 is not installed"
  if [[ "$(rpm -q "$1")" == "$INSTALL_COMPARISON_PATTERN" ]]; then
    install_fedora_package "$1"
  else
    fedora_package_already_installed "$1"
  fi
}

# -----------------------------------------------------------
# If `dnf` is available
# -----------------------------------------------------------
if [ -x "$(command -v dnf)" ]; then
  fedora_package_list_update

  install_fedora_package "git"
  install_fedora_package "curl"
  install_fedora_package "ack"
  install_fedora_package "zsh"
  install_fedora_package "fish"
  install_fedora_package "vim-enhanced"
  # install_fedora_package "ShellCheck"
  # install_fedora_package "whois"
else
  # Exit with error code when dnf is not available
  echo "ERROR: dnf is not available! Nothing happened."
  exit 1
fi
