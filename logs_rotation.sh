#!/bin/bash

# Log directory
log_dir="/var/log/myapp"
# Number of days to retain logs
retention_days=7
# Backup directory for compressed logs
backup_dir="/var/log/myapp/backup"

# Find logs older than retention_days and compress them
find "$log_dir" -name "*.log" -mtime +$retention_days -exec gzip {} \;

# Move the compressed logs to the backup directory
find "$log_dir" -name "*.gz" -exec mv {} "$backup_dir" \;

# Delete logs older than retention_days (keep only compressed logs)
find "$backup_dir" -name "*.gz" -mtime +$retention_days -exec rm -f {} \;

echo "Log rotation and cleanup complete."

