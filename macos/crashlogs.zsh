# -----------------------------------------------------------
# CRASHLOGS
# macOS Crash logs / Diagnostic Reports

# -----------------------------------------------------------
if [ "$SYSTEMTYPE" = "darwin" ] ; then
  # Variables for commonly used directories
  DIRECTORY_SYSTEM_DIAGNOSTICREPORTS="/Library/Logs/DiagnosticReports"
  DIRECTORY_USER_DIAGNOSTICREPORTS="~/Library/Logs/DiagnosticReports"
  DIRECTORY_USER_LOGS="~/Library/Logs"
  DIRECTORY_BACKUP_CRASHLOGS="~/Documents/BACKUPS/crashlogs_backup"


  # macOS Diagnostic Reports
  if [ -d $DIRECTORY_SYSTEM_DIAGNOSTICREPORTS ]; then
    alias maccrashlogs="cd $DIRECTORY_SYSTEM_DIAGNOSTICREPORTS"
  fi

  # macOS user Diagnostic Reports
  if [ -d $DIRECTORY_USER_DIAGNOSTICREPORTS ]; then
    alias macusercrashlogs="cd $DIRECTORY_USER_DIAGNOSTICREPORTS"
  fi

  # macOS user logs
  if [ -d $DIRECTORY_USER_LOGS ]; then
    alias macuserlogs="cd $DIRECTORY_USER_LOGS"
  fi


  # Shortcut to crashlogs_backup directory if there is such
  if [ -d $DIRECTORY_CRASHLOGS_BACKUP ]; then
    alias backups-crashlogs="cd $DIRECTORY_BACKUP_CRASHLOGS"
  fi


  # Make backup of crashlogs to ~/Documents/BACKUPS/crashlogs_backup directory
  # Checks first if there are both original source and end-location for files.
  if [ -d $DIRECTORY_USER_DIAGNOSTICREPORTS -a -d $DIRECTORY_BACKUP_CRASHLOGS ]; then
    crashlogs-backup() {
      cp -anv $DIRECTORY_USER_DIAGNOSTICREPORTS/* $DIRECTORY_BACKUP_CRASHLOGS;
      cp -anv $DIRECTORY_SYSTEM_DIAGNOSTICREPORTS/* $DIRECTORY_BACKUP_CRASHLOGS;
    }
  fi

fi
