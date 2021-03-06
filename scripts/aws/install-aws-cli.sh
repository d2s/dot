#!/bin/bash -
###############################################################################
# install-aws-cli.sh
# This script installs AWS CLI tools from the Python package management system
###############################################################################

# -----------------------------------------------------------
# Unoffical Bash "strict mode"
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\t\n' # Stricter IFS settings
ORIGINAL_IFS=$IFS

# Based on instructions from:
# - https://docs.aws.amazon.com/cli/latest/userguide/cli-install-macos.html
# - https://docs.aws.amazon.com/cli/latest/userguide/install-linux.html

if [ -x "$(command -v python3)" ] ; then
  # which python3
  command -v python3
  # Use pip to install the AWS CLI.
  if [ -x "$(command -v pip3)" ] ; then
    command -v pip3
    echo "Installing the AWS CLI (awscli) with pip3 to your computer:"
    pip3 install awscli --upgrade --user
  fi
elif [ -x "$(command -v python)" ] ; then
  # which python
  command -v python
  echo "Python 3 is required for running the AWS CLI."
elif [ -x "$(command -v python2)" ] ; then
  # which python2
  command -v python2
  echo "Python 3 is required for running the AWS CLI."
else
  echo "Python is required for running the AWS CLI."
fi
