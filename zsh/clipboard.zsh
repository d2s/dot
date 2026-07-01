# clipboard.zsh

# -----------------------------------------------------------
# Clipboard handling aliases similar to macOS commands
#
# - `xclip` CLI tool required for this to work
#   - It can be installed with `sudo apt install xclip`

if [ "$SYSTEMTYPE" = "linux" ] ; then
  # If `xclip` is available, add aliases
  if type -p xclip &>/dev/null; then
    # Copy current working directory path to clipboard
    alias pwdcopy="pwd | xclip -selection clipboard"

    # Copy text to the clipboard from the terminal input
    #
    # Usage example:
    #   echo word | pbcopy
    alias pbcopy='xclip -selection clipboard'

    # Paste text to the clipboard to the terminal
    #
    # Usage example:
    #   pbpaste
    alias pbpaste='xclip -selection clipboard -o'
  fi
fi

# -----------------------------------------------------------
# Location related aliases

if [ "$OS" = "darwin" ] ; then
  # Copy current working directory path to clipboard
  alias pwdcopy="pwd | pbcopy"
fi
