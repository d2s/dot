# -----------------------------------------------------------
# PHP related configs
# -----------------------------------------------------------

# PHP Composer global packages
if [ -d "$HOME/.composer/vendor/bin" ]; then
  export PATH="$HOME/.composer/vendor/bin:$PATH"
fi


# -----------------------------------------------------------
# WordPress CLI autocomplete
# More details: https://make.wordpress.org/cli/handbook/installing/
#source "$ZSH/zsh/autocomplete/wp-completion.bash"
