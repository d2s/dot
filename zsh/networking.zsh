# -----------------------------------------------------------
# Networking toolkit
# -----------------------------------------------------------

# -----------------------------------------------------------
# Shows my public IP address

export IP_ECHO_SERVICE="https://api.ipify.org/"

if type -p curl &>/dev/null; then
  alias miip="curl -o- $IP_ECHO_SERVICE"
elif type -p wget &>/dev/null; then
  alias miip="wget -qO- $IP_ECHO_SERVICE"
else
  if [ "$DEBUG" = "true" ] ; then
    alias miip='echo "NOTE: miip requires either Curl or Wget to work."'
  fi
fi


# -----------------------------------------------------------
# Networking: port numbers

if type -p lsof &>/dev/null; then
  # Find what application is using a port
  #
  # Usage:
  #   findportuser NUMBER
  #
  findportuser() {
    lsof -i :"$1"
  }

  if [ "$OS" = "darwin" ] ; then
    # List open ports on your machine
    alias openports='sudo lsof -i -P | grep -i "listen"'
  fi
fi


# -----------------------------------------------------------
# ip (IPROUTE2)
#
# - https://linux.die.net/man/8/ip
# - http://www.policyrouting.org/iproute2.doc.html
# -----------------------------------------------------------
# If `ip` is available
if type -p ip &>/dev/null; then
  # look at protocol addresses
  alias list-network-address="ip address show"

  # list multicast addresses
  alias list-network-multicast-address="ip maddress show"
fi


# -----------------------------------------------------------
# Various tools
# -----------------------------------------------------------

if type -p telnet &>/dev/null; then
  # MapSCII "The whole world in your console"
  # - https://github.com/rastapasta/mapscii
  alias worldmap="telnet mapscii.me"
else
  if [ "$DEBUG" = "true" ] ; then
    alias worldmap='echo "NOTE: worldmap requires application: telnet"'
  fi
fi

