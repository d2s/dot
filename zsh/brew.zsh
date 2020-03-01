# -----------------------------------------------------------
# Homebrew

DIRECTORY_LINUXBREW="/home/linuxbrew/.linuxbrew"
DIRECTORY_LINUXBREW_BIN="$DIRECTORY_LINUXBREW/bin"

if [ -d "$DIRECTORY_LINUXBREW_BIN" ]; then
  # eval \$($(brew --prefix)/bin/brew shellenv)
  # eval \$(($DIRECTORY_LINUXBREW_BIN)/brew shellenv)
  #export PATH="$PATH:$DIRECTORY_LINUXBREW_BIN"
  export PATH="$DIRECTORY_LINUXBREW_BIN:$PATH"
fi


# - https://github.com/drduh/macOS-Security-and-Privacy-Guide#homebrew
# Check if `brew` is available in the user's PATH
if type -p brew &>/dev/null; then
  export HOMEBREW_NO_ANALYTICS=1
  export HOMEBREW_NO_INSECURE_REDIRECT=1
  export HOMEBREW_CASK_OPTS=--require-sha
fi


# -----------------------------------------------------------
# Homebrew package management helpers
# -----------------------------------------------------------

if type -p brew &>/dev/null; then
  # List what (top level) packages are installed globally
  alias list-installed-brew-packages="brew list"

  # List what globally installed packages are outdated
  alias list-outdated-brew-packages="brew update && brew outdated"

  # Update outdated globally installed npm packages
  alias update-brew-packages="brew update && brew upgrade"

  # Search brew packages
  # Usage:
  #   search_brew_packages KEYWORD
  alias search_brew_packages="brew search"
fi
