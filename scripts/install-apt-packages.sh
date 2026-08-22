#!/usr/bin/env bash
#############################################################
# install-apt-packages.sh
# This script installs tools from Debian packages if possible
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
# Update apt package lists
# Usage:
#   apt_update
# -----------------------------------------------------------
apt_update() {
  printf "\\n"
  printf "Updating apt package lists:"
  printf "\\n"
  sudo apt-get update
  printf "\\n"
  # logger -t install-apt-packages "install-apt-packages.sh updated apt package lists"
}

# -----------------------------------------------------------
# Install package defined in a string variable
# Usage:
#   install_apt_package "package"
# -----------------------------------------------------------
install_apt_package() {
  printf "\\n"
  printf "sudo apt-get install %s\\n" "$1"
  sudo apt-get install "$1"
  printf "\\n\\n"
  logger -t install-apt-packages "install-apt-packages.sh tried to install package: $1"
}

# -----------------------------------------------------------
# Tell user that package has already been installed
# Usage:
#   apt_package_already_installed "package"
# -----------------------------------------------------------
apt_package_already_installed() {
  printf "NOTE: package already installed: %s\\n" "$1"
  printf "\\n"
}

# -----------------------------------------------------------
# If package is not already installed, install it
# Usage:
#   if_not_already_installed "package"
# -----------------------------------------------------------
if_not_already_installed() {
  if [[ ! "$(dpkg -s "$1" | grep Status)" == "Status: install ok installed" ]]; then
    install_apt_package "$1"
  else
    apt_package_already_installed "$1"
  fi
}

# -----------------------------------------------------------
# If `apt` command is available
# -----------------------------------------------------------
if [ -x "$(command -v apt)" ]; then
  # Update apt package lists
  apt_update

  # `whois` records search tool
  if_not_already_installed "whois"

  # Code quality checker for shell scripts
  # - https://github.com/koalaman/shellcheck#user-content-installing
  if_not_already_installed "shellcheck"

  # DNS query tools (including `dig`)
  if_not_already_installed "bind9-dnsutils"

  # Powerline fonts for vim and command line
  if_not_already_installed "powerline"

  # Zsh terminal emulator
  if_not_already_installed "zsh"

  # System performance monitoring tools
  if_not_already_installed "btop"
  if_not_already_installed "htop"

  # Debugging tools
  if_not_already_installed "strace"

  # Downloaders
  if_not_already_installed "curl"

  # Version control
  if_not_already_installed "git"
  if_not_already_installed "gitg"

  # bat file preview tool (batcat command)
  if_not_already_installed "bat"

  # File search tools
  if_not_already_installed "ack"
  if_not_already_installed "tree"

  # NCurses Disk Usage
  # - https://dev.yorhel.nl/ncdu
  if_not_already_installed "ncdu"

  # Dust disk usage
  # - https://github.com/bootandy/dust
  if_not_already_installed "du-dust"

  # Just task runner
  # - https://just.systems/man/en/
  if_not_already_installed "just"

  # Debian package management tools
  # - http://jxf.me/entries/better-apt-ubuntu/
  # Note: Adjust settings after installation with
  #       dpkg-reconfigure apt-listchanges
  if_not_already_installed "apt-listchanges"

  # GCC, the GNU Compiler Collection
  # - https://gcc.gnu.org/
  if_not_already_installed "gcc"

  # The Fast Lexical Analyzer - scanner generator for lexing in C and C++
  # - https://github.com/westes/flex
  if_not_already_installed "flex"

  # GDB: The GNU Project Debugger
  # - https://www.gnu.org/software/gdb/
  if_not_already_installed "gdb"

  # Uptimed (uprecords)
  # - https://github.com/rpodgorny/uptimed
  if_not_already_installed "uptimed"

  # micro text editor
  # - https://micro-editor.github.io
  if_not_already_installed "micro"


else
  # Exit with error code when apt is not available
  echo "ERROR: apt is not available! Nothing happened."
  exit 1
fi
