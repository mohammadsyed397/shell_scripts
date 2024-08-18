#!/bin/bash
# This script is used to find the files which are older than a month, show them, and then delete them.

# Check if the user provided a directory path
if [ -z "$1" ]; then
  echo "Usage: $0 <directory-path>"
  exit 1
fi

# Get the directory path from the first argument
path=$1

# Display the path being processed
echo "Processing directory: $path"

# Show the files that are older than 30 days
echo "The following files are older than 30 days and will be deleted:"
find "$path" -type f -mtime +30

# Ask the user for confirmation before deletion
echo "Do you want to delete these files? (yes/no)"
read answer

if [ "$answer" == "yes" ]; then
    # Find and delete files older than 30 days
    find "$path" -type f -mtime +30 -delete

    # Check if the previous command was successful
    if [ $? -eq 0 ]; then
        echo "Files were successfully deleted."
    else
        echo "There was an issue with deleting files."
    fi
else
    echo "No files were deleted."
fi
