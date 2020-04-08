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

  # -----------------------------------------------------------
  # Branch management
  alias gb="git branch"
  alias git-branch="git branch"
  # List branch details
  alias git-branch-full="git branch -v"
  # List branch details (including remote branches)
  alias git-branch-full-remote="git branch -va"
  alias git-branch-rename-current-to="git branch -m"

  # -----------------------------------------------------------
  alias git-commit="git commit"
  # Amend previous commit
  alias gcan="git commit --amend"
  alias git-commit-amend="git commit --amend"
  # alias gcm="git commit -m"
  # alias fixup="git commit --fixup"

  # `--allow-empty` is an useful tool for annotating non-code changes to a project
  # - https://git-scm.com/docs/git-commit#Documentation/git-commit.txt---allow-empty
  # - https://github.com/tiimgreen/github-cheat-sheet#empty-commits
  alias git-commit-allow-empty="git commit --allow-empty"

  # -----------------------------------------------------------
  # Check when the last changes were made
  # Usage:
  #     git-inspect FILENAME
  alias git-inspect="git blame"

  # List contributors with number of commits
  alias git-contributors="git shortlog --summary --numbered"

  # -----------------------------------------------------------
  # Print out Git config details for specified key,
  # including imported local configuration files.
  #
  # Usage example:
  #     git-config-show-key user.email
  alias git-config-show-key="git config --global --includes"

  # Print out all Git configs
  alias git-config-show-all="git config --global --includes -l"

  # Search from the git configs
  #
  # Usage:
  #     git-config-search PATTERN
  alias git-config-search="git config --global --includes -l |grep"

  # -----------------------------------------------------------
  alias git-clone="git clone"

  alias git-checkout="git checkout"
  alias git-checkout-previous-branch="git checkout -"
  alias gco="git checkout"
  # alias gcop="git checkout --p"

  # Git pull fast forward only
  alias gp="git pull --ff-only --all -p"
  alias git-pull-changes-from-upstream="git fetch upstream && git checkout master && git merge upstream/master"
  # alias gfa="git fetch --all --p"

  # alias gkdm="git kit del--merged"

  # -----------------------------------------------------------
  alias git-diff="git diff"

  # -----------------------------------------------------------
  # alias gpa="git push --u d2s HEAD"
  # alias gph="git push --u origin HEAD"
  # alias gpuo="git push --u origin"
  # alias gpv="git push --u anotheruser HEAD"

  # -----------------------------------------------------------
  # alias gre="git rebase"
  # alias grea="git rebase --abort"
  # alias grec="git rebase --continue"
  # alias grem="git rebase --i master"
  # alias greom="git rebase --i origin/master"
  # alias greum="git rebase --i upstream/master"

  # -----------------------------------------------------------
  # Reset latest modifications to the previous Git commit
  # alias grh="git reset HEAD~"

  # -----------------------------------------------------------
  alias git-remote-list="git remote -v"
  alias git-remote-add-origin="git remote add origin"
  alias git-remote-add-upstream="git remote add upstream"
  alias git-remote-set-url-origin="git remote set-url origin"
  alias git-remote-set-url-upstream="git remote set-url upstream"

  # -----------------------------------------------------------
  alias git-log="git log"
  alias git-log-bat="git-log | bat"

  alias git-log-diff="git-log -p"
  alias git-log-diff-bat="git-log-diff | bat"

  alias git-tree="git log --color=always --decorate --pretty=oneline --abbrev-commit --all --graph"

  alias git-log-branches="git log --color=always --oneline --decorate --graph --branches"
  alias git-log-branches-long="git log --color=always --oneline --decorate --abbrev-commit --date=relative --graph --branches"

  alias gl="git-log-branches"
  alias gl-head="git-log-branches | head"
  alias gl-bat="git-log-branches | bat"

  alias lg="git-log-branches-long"
  alias lg-head="git-log-branches-long | head"
  alias lg-bat="git-log-branches-long | bat"
  alias large-bat="lg-bat"
  alias batman="large-bat"

  alias git-log-branches-in-tag="echo You can append a tag name; LANG=C sleep 0.5; git-log-branches"

  alias git-log-simplify-decorate-full="git log --color=always --decorate=full --simplify-by-decoration"
  alias git-log-simplify="git log --color=always --simplify-by-decoration --decorate"


  # -----------------------------------------------------------
  # Git show latest
  #
  # Search all your previous commit messages
  # and find the most recent one matching the query.
  #
  # - https://github.com/tiimgreen/github-cheat-sheet#git-query
  #
  # Usage:
  #   git-show-latest PATTERN
  # -----------------------------------------------------------
  git-show-latest() {
    git show :/"$1"
  }

  # -----------------------------------------------------------
  alias git-status="git status"
  alias git-status-short-with-branches="git status -sb"
  alias gs="git-status-short-with-branches"
  alias gst="git-status-short-with-branches"

  # -----------------------------------------------------------
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
