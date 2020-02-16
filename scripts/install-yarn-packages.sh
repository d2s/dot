#!/usr/bin/env bash
#############################################################
# install-yarn-packages.sh
# Script installs npm packages with `yarn` if it is available
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
#   install_yarn_package "package"
# -----------------------------------------------------------
install_yarn_package() {
  printf "\\n"
  printf "yarn global add %s\\n" "$1"
  yarn global add "$1"
  printf "\\n\\n"
}

# -----------------------------------------------------------
# Tell user that package has already been installed
# Usage:
#   yarn_package_already_installed "package"
# -----------------------------------------------------------
yarn_package_already_installed() {
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
    install_yarn_package "$1"
  else
    yarn_package_already_installed "$1"
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
    yarn_package_already_installed "$1"
  fi
}


# -----------------------------------------------------------
# If yarn command is available
if [ -x "$(command -v yarn)" ]; then
  # -----------------------------------------------------------
  # Some another package
  # -----------------------------------------------------------
  # if_not_already_installed "package"

  # -----------------------------------------------------------
  # Storybook
  # - https://storybook.js.org/docs/guides/quick-start-guide/
  # - https://storybook.js.org/docs/guides/guide-react/
  # - https://www.npmjs.com/package/@storybook/cli
  # -----------------------------------------------------------
  if_cli_command_does_not_exist "sb" "@storybook/cli" ""

  # -----------------------------------------------------------
else
  echo "NOTE: Yarn is not installed! Nothing happened."
fi
