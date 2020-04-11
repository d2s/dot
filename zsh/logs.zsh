#!/bin/zsh

# -----------------------------------------------------------
# Tools for log management
# -----------------------------------------------------------
if [ "$SYSTEMTYPE" = "linux" ] ; then
  # Follow system log activity on a terminal window
  alias systail="sudo tail -f /var/log/syslog"
elif [ "$OS" = "darwin" ] ; then
  alias systail="tail -f /var/log/system.log"
fi
