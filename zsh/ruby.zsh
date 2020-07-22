# -----------------------------------------------------------
# Add Ruby to PATH if available
# -----------------------------------------------------------
if [ -d "$HOME/.rbenv/bin" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# -----------------------------------------------------------
# Ruby installer
# - Install instructions: https://github.com/rbenv/rbenv#basic-github-checkout
# -----------------------------------------------------------
# If rbenv directory is missing
if [ ! -d "$HOME/.rbenv" ]; then
  alias install-rbenv="git clone https://github.com/rbenv/rbenv.git ~/.rbenv"
fi

# If rbenv binaries directory exists
if [ -d "$HOME/.rbenv/bin" ]; then
  alias update-ruby-rbenv="cd ~/.rbenv && git pull"
  alias update-ruby-build="cd ~/.rbenv/plugins/ruby-build && git pull"

  alias list-available-ruby-versions="rbenv install -l"

  # Specific commands for Ruby 2.7.0 version
  alias install-ruby-v2.7.0="rbenv install 2.7.0"
  alias install-ruby-gems-bundler-v2.7.0-global="rbenv global 2.7.0 && gem install bundler"
  alias install-ruby-gems-bundler-v2.7.0-local="rbenv local 2.7.0 && gem install bundler"

  # Specific commands for Ruby 2.7.1 version
  alias install-ruby-v2.7.1="rbenv install 2.7.1"
  alias install-ruby-gems-bundler-v2.7.1-global="rbenv global 2.7.1 && gem install bundler"
  alias install-ruby-gems-bundler-v2.7.1-local="rbenv local 2.7.1 && gem install bundler"

  alias update-ruby-gems-system="gem update --system"
  alias update-ruby-gems="gem update"

  # Install Jekyll globally (NOTE: might not work properly)
  alias install-ruby-gems-jekyll="gem install jekyll"
fi

# -----------------------------------------------------------
# Productivity tools for RubyGems management
# -----------------------------------------------------------
# If `ruby` is available
if type -p gem &>/dev/null; then
  # List what (top level) packages are installed locally
  alias list-installed-ruby-local-packages="gem query --local"

  # Remove all old versions of the installed Ruby gems
  # - https://stackoverflow.com/questions/5902488/uninstall-old-versions-of-ruby-gems#5902518
  alias cleanup-old-ruby-gems="gem cleanup"
fi
