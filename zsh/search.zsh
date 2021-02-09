# -----------------------------------------------------------
# grep
# -----------------------------------------------------------
# Always enable colored `grep` output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# -----------------------------------------------------------
# Search tools
#
# - g
#   - Search from the current Git repository
# - f
#   - Find text string from the files in the current directory
# - fcss
# - fjs
# - fts
# - fphp
#
# Usage:
#   g PATTERN
#   f PATTERN
# -----------------------------------------------------------

if [[ "$OSTYPE" == *linux* ]]; then
  # Define reusable variables for the search aliases
  FIND_SUB_COMMAND="find . -type f"
  XARGS_GREP_COMMAND="-z | xargs -0 grep -P"

  # Combine variables for use in different types of aliases
  SORT_GREP_COMMAND="| sort $XARGS_GREP_COMMAND"

  # Find from files command variables come in two parts
  FIND_COMMAND_START="$FIND_SUB_COMMAND -name"
  FIND_COMMAND_END="-print0 $SORT_GREP_COMMAND"

  # -----------------------------------------------------------
  # Find text string from files in the current Git repository
  alias g="git ls-files $XARGS_GREP_COMMAND"

  # -----------------------------------------------------------
  # Find from files under of the current directory

  # Find from all of the files
  alias f="$FIND_SUB_COMMAND -print0 $SORT_GREP_COMMAND"

  # Find from the CSS files
  # Usage:
  #   fcss PATTERN
  alias fcss="$FIND_COMMAND_START '*.css' $FIND_COMMAND_END"

  # Find from the JavaScript files
  # Usage:
  #   fjs PATTERN
  alias fjs="$FIND_COMMAND_START '*.js' $FIND_COMMAND_END"

  # Find from the JSX files
  # Usage:
  #   fjsx PATTERN
  alias fjsx="$FIND_COMMAND_START '*.js' $FIND_COMMAND_END"

  # Find from the JSON files
  # Usage:
  #   fjson PATTERN
  alias fjson="$FIND_COMMAND_START '*.json' $FIND_COMMAND_END"

  # Find from the TyperScript files
  # Usage:
  #   fts PATTERN
  alias fts="$FIND_COMMAND_START '*.ts' $FIND_COMMAND_END"

  # Find from the TSX files
  # Usage:
  #   ftsx PATTERN
  alias ftsx="$FIND_COMMAND_START '*.tsx' $FIND_COMMAND_END"

  # Find from the PHP files
  # Usage:
  #   fphp PATTERN
  alias fphp="$FIND_COMMAND_START '*.php' $FIND_COMMAND_END"

  # Find from the Shell files
  # Usage:
  #   fshell PATTERN
  alias fshell="$FIND_COMMAND_START '*.sh' $FIND_COMMAND_END"

  # Find from the Zsh files
  # Usage:
  #   fzsh PATTERN
  alias fzsh="$FIND_COMMAND_START '*.zsh' $FIND_COMMAND_END"

  # Find from the YML files
  # Usage:
  #   fyml PATTERN
  alias fyml="$FIND_COMMAND_START '*.yml' $FIND_COMMAND_END"

  # Find from the YAML files
  # Usage:
  #   fyaml PATTERN
  alias fyaml="$FIND_COMMAND_START '*.yaml' $FIND_COMMAND_END"

  # Find from the Markdown files
  # Usage:
  #   fmarkdown PATTERN
  alias fmarkdown="$FIND_COMMAND_START '*.md' $FIND_COMMAND_END"
fi


# -----------------------------------------------------------
# Word list search
# - Quickly look what words include the given letters
#
# Usage:
#   word full
# -----------------------------------------------------------
word() {
  grep "$1" /usr/share/dict/words
}

# if [ -d "/usr/share/dict/words" ]; then
# fi


# -----------------------------------------------------------
# If `grep` is available
if type -p grep &>/dev/null; then
  # grep through history
  #
  # Usage:
  #   hf KEYWORD
  #
  function hf() {
    history | grep "$1"
  }
fi


# -----------------------------------------------------------
# Keyword explainer tools
#
# Usage:
#   whatis KEYWORD
# -----------------------------------------------------------
# If `wtf` program is available
if type -p wtf &>/dev/null; then
  alias whatis="wtf"
fi


# -----------------------------------------------------------
# Show files changed in 15 minutes
#
# Usage:
#   changed-in-15-minutes
# -----------------------------------------------------------
alias files-changed-in-15-minutes="find . -newerct '15 minute ago' -print"

# -----------------------------------------------------------
# Show files changed in X minutes
#
# Usage:
#   files-changed-in-x-minutes 5
# -----------------------------------------------------------
files-changed-in-x-minutes() {
  find . -newerct "$1 minute ago" -print
}

# -----------------------------------------------------------
# Show files changed in X days
#
# Usage:
#   files-changed-in-x-minutes 5
# -----------------------------------------------------------
files-changed-in-x-days() {
  find . -newerct "$1 days ago" -print
}
