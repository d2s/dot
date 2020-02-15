# -----------------------------------------------------------
# GPG
# -----------------------------------------------------------
# Check if `gpg` is available in the user's PATH
if type -p gpg &>/dev/null; then
  # Tell git about your signing key
  # - https://help.github.com/en/articles/telling-git-about-your-signing-key
  export GPG_TTY=$TTY

  # List GPG secret keys from the local system
  # - https://help.github.com/en/articles/checking-for-existing-gpg-keys
  alias list-gpg-keys='gpg --list-secret-keys --keyid-format LONG'

  # Print the GPG key ID, in ASCII armor format
  #
  # Usage:
  #   list-export-gpg-key KEYID
  alias list-export-gpg-key='gpg --armor --export'
fi


# -----------------------------------------------------------
# SSH Key management
# -----------------------------------------------------------

# Pipe my SSH public key to clipboard
if [ -f ~/.ssh/id_rsa.pub ]; then
  if [ "$SYSTEMTYPE" = "linux" ] ; then
    alias pubkey="more ~/.ssh/id_rsa.pub | xclip -selection clipboard | echo '=> SSH Public key copied to pasteboard.'"
  elif [ "$OS" = "darwin" ] ; then
    alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> SSH Public key copied to pasteboard.'"
  fi
fi

# Pipe my private key to clipboard
# alias prikey="more ~/.ssh/id_rsa | xclip -selection clipboard | echo '=> SSH Private key copied to pasteboard.'"
