
# -----------------------------------------------------------
# Docker aliases
# -----------------------------------------------------------
# If `docker` is available
if type -p docker &>/dev/null; then
  # -----------------------------------------------------------
  # youtube-dl
  # - https://github.com/vimagick/dockerfiles/tree/master/youtube/youtube-dl
  #
  # Usage:
  # - list all formats:
  #   yt -F VIDEOID
  # - Download item:
  #   yt VIDEOID
  alias yt='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data vimagick/youtube-dl'

  # Refresh Docker container to the latest version
  alias update-docker-yt='docker pull vimagick/youtube-dl'

  # -----------------------------------------------------------
  # wtfutil
  #
  # Setup script available:
  # - `../wtfutil/install-wtfutil.sh`

  # Create local variables
  WTF_CONFIG_FILENAME='config.yml'
  WTF_CONFIG_PATH="$ZSH/wtfutil/$WTF_CONFIG_FILENAME"

  # Create alises
  alias wtfutil="docker run -it -v $WTF_CONFIG_PATH:/config/config.yml wtfutil --config=/config/config.yml"
  alias wtfutil_without_config='docker run -it wtfutil'
fi
