# -----------------------------------------------------------
# hub
# -----------------------------------------------------------
# Check if `hub` is available in the user's PATH
if type -p hub &>/dev/null; then
  # Wrap git automatically
  eval "$(hub alias -s)"
fi


# -----------------------------------------------------------
# git
# -----------------------------------------------------------

# If `git` is available
if type -p git &>/dev/null; then
  # Branch management
  alias gb="git branch"
  alias git-branch="git branch"
  # List branch details
  alias git-branch-full="git branch -v"
  # List branch details (including remote branches)
  alias git-branch-full-remote="git branch -va"
  alias git-branch-rename-current-to="git branch -m"

  # Amend previous commit
  alias gcan="git commit --amend"
  alias git-commit-amend="git commit --amend"
  # alias gcm="git commit -m"
  # alias fixup="git commit --fixup"

  alias git-clone="git clone"
  alias git-diff="git diff"

  alias gco="git checkout"
  # alias gcop="git checkout --p"

  # Git pull fast forward only
  alias gp="git pull --ff-only --all -p"
  alias git-pull-changes-from-upstream="git fetch upstream && git checkout master && git merge upstream/master"
  # alias gfa="git fetch --all --p"

  # alias gkdm="git kit del--merged"

  # alias gpa="git push --u d2s HEAD"
  # alias gph="git push --u origin HEAD"
  # alias gpuo="git push --u origin"
  # alias gpv="git push --u anotheruser HEAD"

  # alias gre="git rebase"
  # alias grea="git rebase --abort"
  # alias grec="git rebase --continue"
  # alias grem="git rebase --i master"
  # alias greom="git rebase --i origin/master"
  # alias greum="git rebase --i upstream/master"

  # Reset latest modifications to the previous Git commit
  # alias grh="git reset HEAD~"

  alias git-remote-list="git remote -v"
  alias git-remote-add-origin="git remote add origin"
  alias git-remote-add-upstream="git remote add upstream"
  alias git-remote-set-url-origin="git remote set-url origin"
  alias git-remote-set-url-upstream="git remote set-url upstream"

  alias gl="git log --oneline --color --decorate --graph"
  alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

  alias gs="git status"
  alias gst="git status"
fi

# -----------------------------------------------------------
# hub
# -----------------------------------------------------------

# If `hub` is available
if type -p hub &>/dev/null; then
  alias hc="hub clone"
  alias hcsub="hub clone --recurse-submodules"
  alias hug="hub"
fi
