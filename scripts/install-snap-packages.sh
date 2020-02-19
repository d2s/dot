#!/usr/bin/env bash
#############################################################
# install-snap-packages.sh
# Script installs npm packages with `snap` if it is available
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
# Install package defined in a string variable
# Usage:
#   install_snap_package "package"
# -----------------------------------------------------------
install_snap_package() {
  printf "\\n"
  printf "sudo snap install %s\\n" "$1"
  sudo snap install "$1"
  printf "\\n\\n"
}

# -----------------------------------------------------------
# Tell user that package has already been installed
# Usage:
#   snap_package_already_installed "package"
# -----------------------------------------------------------
snap_package_already_installed() {
  # printf "NOTE: package already installed: %s\\n" "$1"
  printf "NOTE: command already exists: %s\\n" "$1"
  printf "\\n"
}

# -----------------------------------------------------------
# If package is not already installed, install it
# Usage:
#   if_not_already_installed "package"
# -----------------------------------------------------------
if_not_already_installed() {
  if [ ! -x "$(command -v "$1")" ]; then
    install_snap_package "$1"
  else
    snap_package_already_installed "$1"
  fi
}

# -----------------------------------------------------------
# If CLI command is not available, install npm package
# Usage:
#   if_cli_command_does_not_exist "command_name" "package_name" "extra_note"
# -----------------------------------------------------------
if_cli_command_does_not_exist() {
  if [ ! -x "$(command -v "$1")" ]; then
    if_not_already_installed "$2"

    if [ "$3" ]; then
      printf "NOTE: %s\\n" "$3"
      printf "\\n"
    fi
  else
    snap_package_already_installed "$1"
  fi
}

# -----------------------------------------------------------
# If snap command is available
if [ -x "$(command -v snap)" ]; then
  # -----------------------------------------------------------
  # "Streaming music player that finds music sources automatically."
  # - https://github.com/nukeop/nuclear
  # - https://snapcraft.io/nuclear
  # -----------------------------------------------------------
  if_not_already_installed "nuclear"

  # -----------------------------------------------------------
  # Spotify music player (unofficial)
  # - https://snapcraft.io/spotify
  # -----------------------------------------------------------
  # if_not_already_installed "spotify"

  # -----------------------------------------------------------
  # Insomnia
  # - https://insomnia.rest
  # - https://support.insomnia.rest
  # - https://snapcraft.io/insomnia
  # -----------------------------------------------------------
  if_not_already_installed "insomnia"

  # -----------------------------------------------------------
  # VS Code
  # - https://code.visualstudio.com/
  # - https://code.visualstudio.com/docs/supporting/FAQ#_how-to-disable-crash-reporting
  # - https://code.visualstudio.com/License/
  # - https://privacy.microsoft.com/en-us/privacystatement
  # - https://github.com/Microsoft/vscode
  # - https://twitter.com/code
  # - https://snapcraft.io/code
  # -----------------------------------------------------------
  if_not_already_installed "code"

  # -----------------------------------------------------------
  # Firefox (web browser)
  # - https://snapcraft.io/firefox
  # -----------------------------------------------------------
  if_not_already_installed "firefox"

  # -----------------------------------------------------------
  # Storybook
  # -----------------------------------------------------------
  # if_cli_command_does_not_exist "sb" "@storybook/cli" ""

  # -----------------------------------------------------------
else
  echo "NOTE: snap is not installed! Nothing happened."
  echo "Read system setup instructions from: https://snapcraft.io/"
fi
