#!/usr/bin/env bash
#############################################################
# install-yubico-linux-tools.sh
# This script installs tools from Debian packages if possible
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
#   apt_update
# -----------------------------------------------------------
apt_update() {
  printf "\\n"
  printf "Updating apt package lists:"
  printf "\\n"
  sudo apt-get update
  printf "\\n"
}

# -----------------------------------------------------------
# Install package defined in a string variable
# Usage:
#   install_apt_package "package"
# -----------------------------------------------------------
install_apt_package() {
  printf "\\n"
  printf "sudo apt-get install %s\\n" "$1"
  sudo apt-get install "$1"
  printf "\\n\\n"
}

# -----------------------------------------------------------
# Tell user that package has already been installed
# Usage:
#   apt_package_already_installed "package"
# -----------------------------------------------------------
apt_package_already_installed() {
  printf "NOTE: package already installed: %s\\n" "$1"
  printf "\\n"
}

# -----------------------------------------------------------
# If package is not already installed, install it
# Usage:
#   if_not_already_installed "package"
# -----------------------------------------------------------
if_not_already_installed() {
  if [[ ! "$(dpkg -s "$1" | grep Status)" == "Status: install ok installed" ]]; then
    install_apt_package "$1"
  else
    apt_package_already_installed "$1"
  fi
}

# -----------------------------------------------------------
# If `apt` command is available
# -----------------------------------------------------------
if [ -x "$(command -v apt)" ]; then
  # Update apt package lists
  apt_update

  # Add tools for installing PPAs
  # - https://tecadmin.net/add-apt-repository-command-not-found-debain-ubuntu/
  if_not_already_installed "software-properties-common"
  if_not_already_installed "software-properties-gtk"
  # if_not_already_installed "software-properties-kde"

  sudo add-apt-repository ppa:yubico/stable

  # Add keys based on the instructions from:
  # - Enabling the Yubico PPA on Ubuntu
  #   https://support.yubico.com/support/solutions/articles/15000010964-enabling-the-yubico-ppa-on-ubuntu
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 32CBA1A9

  # Update apt package lists
  apt_update

  # Yubico tools
  if_not_already_installed "yubikey-manager-qt"
  if_not_already_installed "yubioath-desktop"
  if_not_already_installed "yubikey-personalization-gui"

else
  # Exit with error code when apt is not available
  echo "ERROR: apt is not available! Nothing happened."
  exit 1
fi
