# Just a config file for Just task runner
# Usage instructions at https://just.systems/man/en/

default:
  git status

commit:
  git commit

publish:
  git push

filesize:
  du -sh

sloc:
  # Calculate lines of code for different files
  @echo "Lines of text in Markdown files:"
  @echo ""
  @echo "`wc -l *.md`"

install-apt-packages:
  ./scripts/install-apt-packages.sh

example-task:
  @echo 'This task does nothing...'
