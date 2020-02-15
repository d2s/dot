# -----------------------------------------------------------
# System information tools
# -----------------------------------------------------------
if [ -f /usr/sbin/system_profiler ]; then
  alias macos-hardware-info="/usr/sbin/system_profiler SPHardwareDataType"
fi


# -----------------------------------------------------------
# File metadata discovery for macOS systems
# -----------------------------------------------------------
alias macos-file-metadata="mdls"
alias macos-file-attributes="xattr -l"


# -----------------------------------------------------------
# Network configuration metadata
#
# - https://github.com/drduh/macOS-Security-and-Privacy-Guide#wi-fi
# -----------------------------------------------------------
alias macos-wifi-configuration="defaults read /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist"
alias macos-wifi-configuration-backup="macos-wifi-configuration > ~/Desktop/macos-wifi-configuration-backup-$(date +%F-%H%M).txt"
alias macos-wifi-grep-SSIDString="macos-wifi-configuration | grep SSIDString | tr -d \"[:blank:]\" | sort | uniq"
alias macos-wifi-network-names="macos-wifi-grep-SSIDString"
alias macos-wifi-grep-ssid="macos-wifi-configuration | grep wifi.ssid | tr -d \"[:blank:]\" | sort | uniq"
