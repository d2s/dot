# -----------------------------------------------------------
# Rust package manager
# -----------------------------------------------------------

# If directory is available
if [ -d "$HOME/.cargo/bin" ]; then
  # Add directory to the PATH
  export PATH="$HOME/.cargo/bin:$PATH"
fi


# -----------------------------------------------------------
# Rust helpers
# -----------------------------------------------------------

# If `rustup` tool is available
if type -p rustup &>/dev/null; then
  alias update-rust="rustup update"
fi

