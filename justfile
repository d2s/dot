# Just a config file for Just task runner
# Usage instructions at https://just.systems/man/en/

# Variables
project := "dot"
GIT_HASH := `git rev-parse --short HEAD`

# Task aliases
alias c := commit
alias s := status
alias l := log

# Default task lists available Just tasks
default:
  @just --list

# Git status
[group('Git')]
status:
  @echo "Git commit hash: {{GIT_HASH}} \n"
  git status -sb

# Git log summary
[group('Git')]
log:
  @echo "Git commit hash: {{GIT_HASH}} \n"
  git log --oneline --graph --decorate -20

# Latest Git commit
[group('Git')]
last:
  @echo "Git commit hash: {{GIT_HASH}} \n"
  git log -1 HEAD --stat

# Commit code changes to Git repository
[group('Git')]
commit:
  git commit

# Publish code changes to GitHub repository
[group('Git')]
publish: check-clean
  git push

# Check repository for uncommitted code changes
[group('Git')]
check-clean:
    @git diff --exit-code || (printf "\e[1;97;43m[Warning]\e[0m Uncommitted changes in {{project}}! \n" && exit 1)
    @git diff --cached --exit-code || (printf "\e[1;97;43m[Warning]\e[0m Staged changes in {{project}}! \n" && exit 1)

# Calculate size of files in the project directory
[group('Helpers')]
filesize:
  du -sh

# Calculate lines of code in different filetypes
[group('Helpers')]
sloc:
  @echo "Lines of text in Markdown files:"
  @echo ""
  @echo "`wc -l *.md`"

# Install APT packages on a Debian Linux distribution
[group('Scripts')]
install-apt-packages:
  ./scripts/install-apt-packages.sh
