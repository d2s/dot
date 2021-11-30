# Git pull changes from upstream branch
#
# Usage:
#     git-pull-changes-from-upstream

function git-pull-changes-from-upstream
  command git fetch upstream && git checkout master && git merge upstream/master
end
