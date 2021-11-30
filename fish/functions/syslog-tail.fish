# Show latest log entries from syslog
#
# Usage:
#   syslog-tail

function syslog-tail
  command sudo tail -f /var/log/syslog
end
