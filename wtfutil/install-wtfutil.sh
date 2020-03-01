#!/usr/bin/env bash
#############################################################
# This script installs wtfutil if possible
#
# - https://wtfutil.com/
# - https://github.com/wtfutil/wtf
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
# If `curl` command is available
# -----------------------------------------------------------
if [ -x "$(command -v curl)" ]; then
  # download or create the Dockerfile
  curl -o Dockerfile https://raw.githubusercontent.com/wtfutil/wtf/master/Dockerfile

  # -----------------------------------------------------------
  # If `docker` command is available
  # -----------------------------------------------------------
  if [ -x "$(command -v docker)" ]; then

    # Build the docker container
    docker build -t wtfutil .

    # or for a particular tag or branch
    # docker build --build-arg=version=v0.25.0 -t wtfutil .
    docker build --build-arg=version=v0.27.0 -t wtfutil .

    # Run the container (to check that it works)
    docker run -it wtfutil

    # Run container with a local config file
    # docker run -it -v path/to/config.yml:/config/config.yml wtfutil --config=/config/config.yml
  else
    # Exit with error code when apt is not available
    echo "ERROR: docker is not available! Docker is required to run the build process!"
    exit 1
  fi
else
  # Exit with error code when apt is not available
  echo "ERROR: curl is not available! Nothing happened."
  exit 1
fi
