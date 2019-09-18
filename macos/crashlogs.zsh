# -----------------------------------------------------------
# CRASHLOGS
# macOS Crash logs / Diagnostic Reports

# macOS Diagnostic Reports
if [ -d /Library/Logs/DiagnosticReports ]; then
  alias maccrashlogs='cd /Library/Logs/DiagnosticReports'
fi

# macOS user Diagnostic Reports
if [ -d ~/Library/Logs/DiagnosticReports ]; then
  alias macusercrashlogs='cd ~/Library/Logs/DiagnosticReports'
fi

# macOS user logs
if [ -d ~/Library/Logs ]; then
  alias macuserlogs="cd ~/Library/Logs"
fi


# Shortcut to crashlogs_backup directory if there is such
if [ -d ~/Documents/BACKUPS/crashlogs_backup ]; then
  alias backups-crashlogs="cd ~/Documents/BACKUPS/crashlogs_backup"
fi


# Make backup of crashlogs to ~/Documents/BACKUPS/crashlogs_backup directory
# Checks first if there are both original source and end-location for files.
if [ -d ~/Library/Logs/DiagnosticReports -a -d ~/Documents/BACKUPS/crashlogs_backup ]; then
  crashlogs-backup() {
    cp -anv ~/Library/Logs/DiagnosticReports/* ~/Documents/BACKUPS/crashlogs_backup;
    cp -anv /Library/Logs/DiagnosticReports/* ~/Documents/BACKUPS/crashlogs_backup;
  }
fi
