#!/bin/bash
# Get directory path (use current directory if not provided)
dir="${1:-.}"

# Find the largest file in the directory
largest_file=$(find "$dir" -type f -exec ls -s {} + | sort -n -r | head -n 1)

# Display the largest file and its size
echo "Largest file: $largest_file"

