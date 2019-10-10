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
ORIGINAL_IFS=$IFS

# -----------------------------------------------------------
# Go to user account's home directory
cd "$HOME"

# -----------------------------------------------------------
# Commonly used text strings for the script
NOTE_APT_INSTALL="apt install:"
NOTE_COMMAND_EXISTS_ALREADY="NOTE: already installed:"

# -----------------------------------------------------------
# TODO: Make a wrapper function that improves the installation process consistency
# APT_COMMAND_FOR_INSTALLING="$(sudo apt install)"



# -----------------------------------------------------------
# If `apt` command is available
if [ -x "$(command -v apt)" ]; then

  # -----------------------------------------------------------
  # `whois` records search tool

  # What is the apt package name for the application?
  APT_PACKAGES_WHOIS="whois"

  # If CLI command is not already existing
  if [ ! -x "$(command -v $APT_PACKAGES_WHOIS)" ]; then
    # Install related npm packages to get the application
    echo "$NOTE_APT_INSTALL $APT_PACKAGES_WHOIS"
    sudo apt install $APT_PACKAGES_WHOIS
  else
    echo "$NOTE_COMMAND_EXISTS_ALREADY $APT_PACKAGES_WHOIS"
  fi

  # -----------------------------------------------------------
  # Code quality checker for shell scripts
  # - https://github.com/koalaman/shellcheck#user-content-installing

  # What is the apt package name for the application?
  APT_PACKAGES_SHELLCHECK="shellcheck"

  # If CLI command is not already existing
  if [ ! -x "$(command -v $APT_PACKAGES_SHELLCHECK)" ]; then
    # Install related npm packages to get the application
    echo "$NOTE_APT_INSTALL $APT_PACKAGES_SHELLCHECK"
    sudo apt install $APT_PACKAGES_SHELLCHECK
  else
    echo "$NOTE_COMMAND_EXISTS_ALREADY $APT_PACKAGES_SHELLCHECK"
  fi

  # -----------------------------------------------------------
  # `pcregrep` Perl 5 compatible regular expressions

  # What is the apt package name for the application?
  APT_PACKAGES_PCREGREP="pcregrep"

  # If CLI command is not already existing
  if [ ! -x "$(command -v $APT_PACKAGES_PCREGREP)" ]; then
    # Install related npm packages to get the application
    echo "$NOTE_APT_INSTALL $APT_PACKAGES_PCREGREP"
    sudo apt install $APT_PACKAGES_PCREGREP
  else
    echo "$NOTE_COMMAND_EXISTS_ALREADY $APT_PACKAGES_PCREGREP"
  fi

  # -----------------------------------------------------------
  # DNS query tools (including `dig`)

  # What is the apt package name for the application?
  APT_PACKAGES_DNS="dnsutils"

  # If CLI command is not already existing
  if [ ! -x "$(command -v $APT_PACKAGES_DNS)" ]; then
    # Install related npm packages to get the application
    echo "$NOTE_APT_INSTALL $APT_PACKAGES_DNS"
    sudo apt install $APT_PACKAGES_DNS
  else
    echo "$NOTE_COMMAND_EXISTS_ALREADY $APT_PACKAGES_DNS"
  fi

  # -----------------------------------------------------------

else
  echo "NOTE: apt is not available! Nothing happened."
fi
