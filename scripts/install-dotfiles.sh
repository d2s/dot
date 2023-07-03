#!/usr/bin/env bash
#############################################################
# install-dotfiles.sh
# Script installs npm packages if `npm` command is available
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
# cd "$HOME"

# -----------------------------------------------------------
# Setup repository
# -----------------------------------------------------------
# ln -sf ~/projects/github/d2s/dot ~/.dotfiles

# -----------------------------------------------------------
# Git configuration
# -----------------------------------------------------------
ln -sf ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/git/gitignore_global ~/.gitignore
ln -sf ~/.dotfiles/git/gitattributes ~/.gitattributes
