# Git pull changes from upstream branch
#
# Usage:
#     git-pull-changes-from-upstream

function git-pull-changes-from-upstream
  command git fetch upstream && git checkout main && git merge upstream/main
end
