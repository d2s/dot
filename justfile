# Just a config file for Just task runner
# Usage instructions at https://just.systems/man/en/

# Variables
project := "dot"
alias c := commit

# Default task
default:
  git status

# Commit code changes to Git repository
commit:
  git commit

# Publish code changes to GitHub repository
publish:
  git push

# Calculate size of files in the project directory
filesize:
  du -sh

# Calculate lines of code in different filetypes
sloc:
  @echo "Lines of text in Markdown files:"
  @echo ""
  @echo "`wc -l *.md`"

# Install APT packages on a Debian Linux distribution
install-apt-packages:
  ./scripts/install-apt-packages.sh

# Exanple task
example-task:
  @echo 'This task does nothing...'

# Check repository for uncommitted code changes
_check-clean:
    @git diff --exit-code || (printf "\e[1;97;43m[Warning]\e[0m Uncommitted changes in {{project}}! \n" && exit 1)
    @git diff --cached --exit-code || (printf "\e[1;97;43m[Warning]\e[0m Staged changes in {{project}}! \n" && exit 1)
