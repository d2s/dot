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
else
  alias processes_all="ps -Afjv"
fi
