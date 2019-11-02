#!/usr/bin/env bash
###############################################################################
# install-yarn-packages.sh
# This script installs npm packages with `yarn` if it is available
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
NOTE_YARN_INSTALL="yarn install:"
NOTE_COMMAND_EXISTS_ALREADY="NOTE: already installed:"

# -----------------------------------------------------------
# TODO: Make a wrapper function that improves the installation process consistency
# NPM_COMMAND_FOR_INSTALLING="$(npm install -g)"



# -----------------------------------------------------------
# If npm command is available
if [ -x "$(command -v yarn)" ]; then

  # -----------------------------------------------------------
  # Storybook
  # - https://storybook.js.org/docs/guides/quick-start-guide/
  # - https://storybook.js.org/docs/guides/guide-react/
  # - https://www.npmjs.com/package/@storybook/cli
  #
  # What is the CLI command for the application?
  YARN_PACKAGES_STORYBOOK_COMMAND="sb"

  # What is the npm package for the application?
  YARN_PACKAGES_STORYBOOK="@storybook/cli"

  # If CLI command is not already existing
  if [ ! -x "$(command -v $YARN_PACKAGES_STORYBOOK_COMMAND)" ]; then
    # Install related npm packages to get the application
    echo "$NOTE_YARN_INSTALL $YARN_PACKAGES_STORYBOOK"
    yarn global add $YARN_PACKAGES_STORYBOOK
  else
    echo "$NOTE_COMMAND_EXISTS_ALREADY $YARN_PACKAGES_STORYBOOK_COMMAND"
  fi

  # -----------------------------------------------------------
  # ...

else
  echo "NOTE: Yarn is not installed! Nothing happened."
fi
