#!/bin/bash -
###############################################################################
# setup.sh
# This script creates everything needed to get started on a new machine
###############################################################################

# -----------------------------------------------------------
# Unoffical Bash "strict mode"
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\t\n' # Stricter IFS settings
ORIGINAL_IFS=$IFS

# -----------------------------------------------------------
# Go to user account's home directory
cd $HOME

# -----------------------------------------------------------
# Commonly used text strings for the script
NOTE_NPM_INSTALL="npm install:"
NOTE_COMMAND_EXISTS_ALREADY="NOTE: already installed:"

# -----------------------------------------------------------
# TODO: Make a wrapper function that improves the installation process consistency
# NPM_COMMAND_FOR_INSTALLING="$(npm install -g)"



# -----------------------------------------------------------
# If npm command is available
if [ -x "$(command -v npm)" ]; then

  # -----------------------------------------------------------
  # open-cli helper tool
  # - https://github.com/sindresorhus/open-cli
  # What is the npm package for the application?
  NPM_PACKAGES_OPEN="open-cli"

  # If CLI command is not already existing
  if [ ! -x "$(command -v $NPM_PACKAGES_OPEN)" ]; then
    # Install related npm packages to get the application
    echo "$NOTE_NPM_INSTALL $NPM_PACKAGES_OPEN"
    npm install -g $NPM_PACKAGES_OPEN
  else
    echo "$NOTE_COMMAND_EXISTS_ALREADY $NPM_PACKAGES_OPEN"
  fi

  # -----------------------------------------------------------
  # ZEIT Now
  # "a cloud platform for static sites and serverless functions"
  # - https://zeit.co/docs/v2/introduction/

  # What is the npm package for the application?
  NPM_PACKAGES_NOW="now"

  # If `now` is not already installed
  if [ ! -x "$(command -v $NPM_PACKAGES_NOW)" ]; then
    # Install related npm packages to get the application
    echo "$NOTE_NPM_INSTALL $NPM_PACKAGES_NOW"
    npm install -g $NPM_PACKAGES_NOW
  else
    echo "$NOTE_COMMAND_EXISTS_ALREADY $NPM_PACKAGES_NOW"
  fi

  # -----------------------------------------------------------
  # Netlify:
  # "continuous deployment, serverless functions, web hosting"
  # - https://www.netlify.com/
  # - https://www.netlify.com/docs/cli/
  #
  # What is the CLI command for the application?
  NPM_PACKAGES_NETLIFY_COMMAND="netlify"

  # What is the npm package for the application?
  NPM_PACKAGES_NETLIFY="netlify-cli"

  # If CLI command is not already existing
  if [ ! -x "$(command -v $NPM_PACKAGES_NETLIFY_COMMAND)" ]; then
    # Install related npm packages to get the application
    echo "$NOTE_NPM_INSTALL $NPM_PACKAGES_NETLIFY"
    npm install -g $NPM_PACKAGES_NETLIFY
    echo "NOTE: Remember to run additional command to finish the installation: netlify login"
  else
    echo "$NOTE_COMMAND_EXISTS_ALREADY $NPM_PACKAGES_NETLIFY_COMMAND"
  fi

  # -----------------------------------------------------------
  # ...

else
  echo "NOTE: npm is not installed! Nothing happened."
fi
