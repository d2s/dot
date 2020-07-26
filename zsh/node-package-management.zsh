# -----------------------------------------------------------
# nvm (Node Version Manager)
# - https://github.com/creationix/nvm
#
# TODO: look at https://github.com/nodenv/nodenv/wiki/Alternatives
#
# Note that loading nvm makes starting new shell much slower!

if [ $DISABLE_NVM = "false" ] ; then
  if [ -d "$HOME/.nvm" ]; then
    # export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    export NVM_DIR="$HOME/.nvm"

    # This loads nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # This loads nvm bash_completion
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    # npq CLI
    # "safely* install packages with npm or yarn by auditing them as part of your install process"
    # - https://www.npmjs.com/package/npq
    # - https://github.com/lirantal/npq
    alias npm='npq-hero'
  fi
fi


# -----------------------------------------------------------
# Disable npm package usage tracking
# - https://www.npmjs.com/package/@scarf/scarf
# -----------------------------------------------------------
export SCARF_ANALYTICS=false


# -----------------------------------------------------------
# Yarn
# -----------------------------------------------------------
# Check if `yarn` is available in the user's PATH
if type -p yarn &>/dev/null; then
  # Add the install location of global binaries to your PATH
  # More details: https://yarnpkg.com/en/docs/cli/global
  export PATH="$(yarn global bin):$PATH"

  # npq CLI
  # "safely* install packages with npm or yarn
  # by auditing them as part of your install process"
  # - https://www.npmjs.com/package/npq
  # - https://github.com/lirantal/npq
  alias yarn="NPQ_PKG_MGR=yarn npq-hero"

  # List what (top level) packages are installed globally
  alias list-installed-yarn-global-packages="yarn global list --depth=0"

  # Update outdated globally installed npm packages
  alias update-yarn-global-packages="yarn global upgrade-interactive"
fi


# -----------------------------------------------------------
# npm helpers
# -----------------------------------------------------------

# List what (top level) packages are installed globally
alias list-installed-npm-packages="npm ls -g --depth=0."

# List what globally installed packages are outdated
alias list-outdated-npm-packages="npm outdated -g --depth=0."

# Update outdated globally installed npm packages
alias update-npm-packages="npm update -g"
