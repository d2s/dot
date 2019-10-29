#!/bin/bash -
###############################################################################
# install-apt-packages.sh
# This script installs tools from apt packages if possible
###############################################################################

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
# Commonly used text strings for the script
NOTE_APT_INSTALL="sudo apt install"
NOTE_PACKAGE_EXISTS_ALREADY="NOTE: package already installed:"
NOTE_LINESPACE=""

# String to compare to check if package already installed
PACKAGE_STATUS_INSTALL_OK="Status: install ok installed"

# -----------------------------------------------------------
# TODO: Make a wrapper function that improves the installation process consistency

# -----------------------------------------------------------
# If `apt` command is available
if [ -x "$(command -v apt)" ]; then
  echo "$NOTE_LINESPACE"

  # -----------------------------------------------------------
  # `whois` records search tool

  # What is the apt package name for the application?
  APT_PACKAGES_WHOIS="whois"

  # If the package is not already installed
  if [[ ! "$(dpkg -s $APT_PACKAGES_WHOIS | grep Status)" == "$PACKAGE_STATUS_INSTALL_OK" ]]; then
    echo "$NOTE_LINESPACE"
    # Install related apt packages to get the application
    echo "$NOTE_APT_INSTALL $APT_PACKAGES_WHOIS"
    sudo apt install "$APT_PACKAGES_WHOIS"
    echo "$NOTE_LINESPACE"
  else
    echo "$NOTE_PACKAGE_EXISTS_ALREADY $APT_PACKAGES_WHOIS"
    echo "$NOTE_LINESPACE"
  fi

  # -----------------------------------------------------------
  # Code quality checker for shell scripts
  # - https://github.com/koalaman/shellcheck#user-content-installing

  # What is the apt package name for the application?
  APT_PACKAGES_SHELLCHECK="shellcheck"

  # If the package is not already installed
  if [[ ! "$(dpkg -s $APT_PACKAGES_SHELLCHECK | grep Status)" == "$PACKAGE_STATUS_INSTALL_OK" ]]; then
    echo "$NOTE_LINESPACE"
    # Install related apt packages to get the application
    echo "$NOTE_APT_INSTALL $APT_PACKAGES_SHELLCHECK"
    sudo apt install "$APT_PACKAGES_SHELLCHECK"
    echo "$NOTE_LINESPACE"
  else
    echo "$NOTE_PACKAGE_EXISTS_ALREADY $APT_PACKAGES_SHELLCHECK"
    echo "$NOTE_LINESPACE"
  fi

  # -----------------------------------------------------------
  # `pcregrep` Perl 5 compatible regular expressions

  # What is the apt package name for the application?
  APT_PACKAGES_PCREGREP="pcregrep"

  # If the package is not already installed
  if [[ ! "$(dpkg -s $APT_PACKAGES_PCREGREP | grep Status)" == "$PACKAGE_STATUS_INSTALL_OK" ]]; then
    echo "$NOTE_LINESPACE"
    # Install related apt packages to get the application
    echo "$NOTE_APT_INSTALL $APT_PACKAGES_PCREGREP"
    sudo apt install "$APT_PACKAGES_PCREGREP"
    echo "$NOTE_LINESPACE"
  else
    echo "$NOTE_PACKAGE_EXISTS_ALREADY $APT_PACKAGES_PCREGREP"
    echo "$NOTE_LINESPACE"
  fi

  # -----------------------------------------------------------
  # DNS query tools (including `dig`)

  # What is the apt package name for the application?
  APT_PACKAGES_DNS="dnsutils"

  # If the package is not already installed
  if [[ ! "$(dpkg -s $APT_PACKAGES_DNS | grep Status)" == "$PACKAGE_STATUS_INSTALL_OK" ]]; then
    echo "$NOTE_LINESPACE"
    # Install related apt packages to get the application
    echo "$NOTE_APT_INSTALL $APT_PACKAGES_DNS"
    sudo apt install "$APT_PACKAGES_DNS"
    echo "$NOTE_LINESPACE"
  else
    echo "$NOTE_PACKAGE_EXISTS_ALREADY $APT_PACKAGES_DNS"
    echo "$NOTE_LINESPACE"
  fi


  # -----------------------------------------------------------
  # Chromium (web browser)

  # What is the command for starting the application?
  APT_PACKAGES_CHROMIUM_COMMAND="chromium"

  # What is the apt package name(s) for the application?
  APT_PACKAGES_CHROMIUM="chromium chromium-sandbox"

  # If the package is not already installed
  if [[ ! "$(dpkg -s $APT_PACKAGES_CHROMIUM_COMMAND | grep Status)" == "$PACKAGE_STATUS_INSTALL_OK" ]]; then
    echo "$NOTE_LINESPACE"
    # Install related apt packages to get the application
    echo "$NOTE_APT_INSTALL $APT_PACKAGES_CHROMIUM"
    sudo apt install "$APT_PACKAGES_CHROMIUM"
    echo "$NOTE_LINESPACE"
  else
    echo "$NOTE_PACKAGE_EXISTS_ALREADY $APT_PACKAGES_CHROMIUM_COMMAND"
    echo "$NOTE_LINESPACE"
  fi

  # -----------------------------------------------------------

else
  echo "NOTE: apt is not available! Nothing happened."
fi
