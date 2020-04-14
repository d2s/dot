# -----------------------------------------------------------
# Jump to favorite locations
# -----------------------------------------------------------

if [ "$ZSH" ] ; then
  alias dotfiles="cd $ZSH"
  alias dotfiles-scripts="cd $ZSH/scripts"
  alias dotfiles-zsh="cd $ZSH/zsh"
fi

if [ "$PROJECTS" ] ; then
  alias projects="cd $PROJECTS"
  alias github="cd $PROJECTS/github.com"
  alias github-d2s="cd $PROJECTS/github.com/d2s"
  alias github-d2s-gist="cd $PROJECTS/github.com/d2s/gist"
  alias knowledge="cd $PROJECTS/github.com/d2s/knowledge"
  alias colorpicker="cd $PROJECTS/github.com/d2s/colorpicker"
  alias companies="cd $PROJECTS/github.com/d2s/companies"
  alias gitlab="cd $PROJECTS/gitlab.com"
  alias bitbucket="cd $PROJECTS/bitbucket.org"
fi

# -----------------------------------------------------------
# Directory aliases for Linux
if [[ "$OSTYPE" == *linux* ]]; then
  # User directories
  alias desktop="cd $HOME/Desktop"
  alias documents="cd $HOME/Documents"
  alias downloads="cd $HOME/Downloads"

  # System directories
  alias etc="cd /etc"
fi


# -----------------------------------------------------------
# Directory aliases for macOS
if [[ "$OSTYPE" == *darwin* ]]; then
  # User directories
  alias desktop="cd $HOME/Desktop"
  alias documents="cd $HOME/Documents"
  alias downloads="cd $HOME/Downloads"
  alias movies="cd $HOME/Movies"
  alias music="cd $HOME/Music"
  alias pictures="cd $HOME/Pictures"
  alias public="cd $HOME/Public"

  # System directories
  alias etc="cd /private/etc"
fi
