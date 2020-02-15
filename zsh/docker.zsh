
# -----------------------------------------------------------
# Docker aliases
# -----------------------------------------------------------
# If `docker` is available
if type -p docker &>/dev/null; then
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
fi


