#!/bin/sh

# -----------------------------------------------------------
# Install tools if Homebrew if installed

if [ -x "$(command -v brew)" ] ; then
  echo ""
  echo "Installing tools with Homebrew:"
  echo ""
  brew install zsh git youtube-dl yarn wget hugo hub tree
else
  echo ""
  echo "You need to have Homebrew installed (before installing other tools with it)."
  echo "Read more from the website: https://brew.sh/"
fi
