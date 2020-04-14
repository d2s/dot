#!/bin/zsh

# -----------------------------------------------------------
# Python related Zsh configs
# -----------------------------------------------------------

# -----------------------------------------------------------
# `pyenv` (Python version management)
#
# - https://github.com/pyenv/pyenv
# - https://github.com/pyenv/pyenv#installation
# - https://github.com/pyenv/pyenv/wiki
# - https://github.com/pyenv/pyenv/wiki/Common-build-problems
# - https://medium.com/@cjolowicz/hypermodern-python-d44485d9d769
# -----------------------------------------------------------

# Add directory to path if it exists
if [ -d "$HOME/.pyenv" ]; then
  # ---------------------------------------------------------
  # Add environmental variables
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"

  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
  fi

  # ---------------------------------------------------------
  # Python version management
  # ---------------------------------------------------------
  # - https://www.python.org/downloads/release/python-382/
  alias install-python-version-3.8.2="pyenv install 3.8.2"

  # ---------------------------------------------------------
  # Virtual environments
  #
  # - https://docs.python.org/3/library/venv.html
  # - https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/
  # ---------------------------------------------------------
  alias create-new-python-venv="python3 -m venv .venv"

  alias activate-python-venv="source .venv/bin/activate"
  alias deactivate-python-venv="deactivate"

  # ---------------------------------------------------------
  # Update to latest version of `pip` package management tool
  # ---------------------------------------------------------
  alias install-python-latest-pip="pip install --upgrade pip"

  # ---------------------------------------------------------
fi

