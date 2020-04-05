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
  alias git-log-diff="git log -p"
  alias git-tree="git log --graph --decorate --pretty=oneline --abbrev-commit --all"
  alias gl="git log --oneline --color --decorate --graph"
  alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
  alias lg-head="lg | head"
  # alias lg-less="lg | less"

  # -----------------------------------------------------------
  alias git-status="git status"
  alias gs="git status"
  alias gst="git status"

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
