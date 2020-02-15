# clipboard.zsh

# -----------------------------------------------------------
# Location related aliases

# Copy name of current workind directory to clipboard
if [ "$SYSTEMTYPE" = "linux" ] ; then
  alias pwdcopy="pwd | xclip -selection clipboard"
elif [ "$OS" = "darwin" ] ; then
  alias pwdcopy="pwd | pbcopy"
fi

# -----------------------------------------------------------
# Clipboard handling aliases similar to macOS commands

if [ "$SYSTEMTYPE" = "linux" ] ; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi
