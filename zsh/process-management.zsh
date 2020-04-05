# -----------------------------------------------------------
# List active processes

if [ "$OS" = "darwin" ] ; then
  alias top="top -o cpu"
# else
  # alias top="top"
fi

# -----------------------------------------------------------
if [ "$SYSTEMTYPE" = "linux" ] ; then
  # List all processes
  alias processes_all="ps -AFH"
  alias processes_sorted="ps auwwx | sort -rk 3,3 | head"

  # Usage:
  #   processes_my_search PATTERN
  alias processes_my_search="ps auwwx | grep -i -e ^USER -e"
else
  alias processes_all="ps -Afjv"
  alias processes_sorted='ps auwwx | head'

  # Usage:
  #   processes_my_search PATTERN
  alias processes_my_search="ps auwwx | grep -i -e ^USER -e"
fi
