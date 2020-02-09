#!/bin/zsh

# -----------------------------------------------------------
# D language install tool
# - https://dlang.org/dmd-linux.html
# - https://dlang.org/install.html
# -----------------------------------------------------------
# Set variable for the D language location
LOCAL_DLANG_PATH="$HOME/dlang"

# If directory is missing, offer alias for installing it
if [ ! -d "$LOCAL_DLANG_PATH" ]; then
  alias dlang-download-installer="mkdir -p $LOCAL_DLANG_PATH && wget https://dlang.org/install.sh -O $LOCAL_DLANG_PATH/install.sh && chmod u+x $LOCAL_DLANG_PATH/install.sh"
fi

# Installer tool
if [ -d "$LOCAL_DLANG_PATH" ]; then
  alias dlang-install="$LOCAL_DLANG_PATH/install.sh"
  alias dlang-install-list="$LOCAL_DLANG_PATH/install.sh list"
  alias dlang-install-update="$LOCAL_DLANG_PATH/install.sh update"
fi

# -----------------------------------------------------------
# D language compiler
# -----------------------------------------------------------
# Set variable for the compiler location
LOCAL_DLANG_COMPILER_VERSION="dmd-2.090.0"
LOCAL_DLANG_COMPILER_PATH="$LOCAL_DLANG_PATH/$LOCAL_DLANG_COMPILER_VERSION"

if [ -d "$LOCAL_DLANG_COMPILER_PATH" ]; then
  # -----------------------------------------------------------
  # Run `source ~/dlang/dmd-2.090.0/activate` in your shell to use dmd-2.090.0.
  # This will setup PATH, LIBRARY_PATH, LD_LIBRARY_PATH, DMD, DC, and PS1.
  # Run `deactivate` later on to restore your environment.
  source "$LOCAL_DLANG_COMPILER_PATH/activate"
fi

# -----------------------------------------------------------
# D package management system
# -----------------------------------------------------------
# Set variable
LOCAL_DLANG_DUP_PATH="$HOME/.dub"
LOCAL_DLANG_DUP_PACKAGES_PATH="$LOCAL_DLANG_DUP_PATH/packages"

# If directory exists
if [ -d "$LOCAL_DLANG_DUP_PACKAGES_PATH" ]; then
  # List of contents from the dub packages directory
  alias list-dub-packages="ll $HOME/.dub/packages"
fi

