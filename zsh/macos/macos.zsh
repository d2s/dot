# macOS related aliases
if [ -f "$ZSH/zsh/macos/macos_aliases.zsh" ]; then
  source "$ZSH/zsh/macos/macos_aliases.zsh"
fi

# Load ZSH aliases for macOS related tools
if [ -f "$ZSH/zsh/macos/crashlogs.zsh" ]; then
  source "$ZSH/zsh/macos/crashlogs.zsh"
fi

# PHP from Homebrew package manager
if [ -d "/usr/local/opt/php@7.1/bin" ]; then
  export PATH="/usr/local/opt/php@7.1/bin:$PATH"
fi

if [ -d "/usr/local/opt/php@7.1/sbin" ]; then
  export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
fi

# Python 3.6
# - Add binaries installed with pip3 to the PATH
if [ -d "$HOME/Library/Python/3.6/bin" ]; then
  export PATH="$HOME/Library/Python/3.6/bin:$PATH"
fi

# iTerm2 shell integration
if [ -f "${HOME}/.iterm2_shell_integration.zsh" ]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
fi
