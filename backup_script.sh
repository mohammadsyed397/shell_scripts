#!/bin/bash

# Directory to back up
source_dir="/path/to/source"
# Backup destination directory
backup_dir="/path/to/backup"
# Get the current timestamp
timestamp=$(date +%Y%m%d_%H%M%S)
# Backup file name
backup_file="${backup_dir}/backup_${timestamp}.tar.gz"

# Create a backup
tar -czf "$backup_file" "$source_dir"

echo "Backup created: $backup_file"

