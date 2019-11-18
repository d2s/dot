#!/usr/bin/env bash
###############################################################################
# install-npm-packages.sh
# This script installs npm packages if `npm` command is available
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
# Install package defined in a string variable
# Usage:
#   install_npm_package "package"
install_npm_package() {
  printf "\\n"
  printf "npm install -g %s\\n" "$1"
  npm install -g "$1"
  printf "\\n\\n"
}

# -----------------------------------------------------------
# Tell user that package has already been installed
# Usage:
#   npm_package_already_installed "package"
npm_package_already_installed() {
  # printf "NOTE: package already installed: %s\\n" "$1"
  printf "NOTE: command already exists: %s\\n" "$1"
  printf "\\n"
}

# -----------------------------------------------------------
# If package is not already installed, install it
# Usage:
#   if_not_already_installed "package"
if_not_already_installed() {
  if [ ! -x "$(command -v "$1")" ]; then
    install_npm_package "$1"
  else
    npm_package_already_installed "$1"
  fi
}

# -----------------------------------------------------------
# If CLI command is not available, install npm package
# Usage:
#   if_cli_command_does_not_exist "command_name" "package_name" "extra_note"
if_cli_command_does_not_exist() {
  if [ ! -x "$(command -v "$1")" ]; then
    if_not_already_installed "$2"

    if [ "$3" ]; then
      printf "NOTE: %s\\n" "$3"
      printf "\\n"
    fi
  else
    npm_package_already_installed "$1"
  fi
}

# -----------------------------------------------------------
# If npm command is available
if [ -x "$(command -v npm)" ]; then

  if_not_already_installed "diff-so-fancy"

  # open-cli helper tool
  # - https://github.com/sindresorhus/open-cli
  if_not_already_installed "open-cli"

  # serve directory via HTTP
  # - https://www.npmjs.com/package/serve
  if_not_already_installed "serve"

  # ZEIT Now
  # "a cloud platform for static sites and serverless functions"
  # - https://zeit.co/docs/v2/introduction/
  if_not_already_installed "now"

  # -----------------------------------------------------------
  # Netlify:
  # "continuous deployment, serverless functions, web hosting"
  # - https://www.netlify.com/
  # - https://www.netlify.com/docs/cli/
  if_cli_command_does_not_exist "netlify" "netlify-cli" "NOTE: Remember to run 'netlify login' to finish the installation."

  # -----------------------------------------------------------
  # Preact CLI
  # - https://preactjs.com/guide/v10/getting-started
  # - https://www.npmjs.com/package/preact-cli
  if_cli_command_does_not_exist "preact" "preact-cli" ""

  # -----------------------------------------------------------
else
  echo "NOTE: npm is not installed! Nothing happened."
fi
