#!/bin/bash
#set threshold (without % symbol)
threshold=80

# Get current disk usage percentage (remove % symbol)
# This line gets the disk usage and removes the '%' symbol
disk_usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if disk usage exceeds the threshold
# Now we compare the integer values of disk_usage and threshold
if [ "$disk_usage" -gt "$threshold" ]; then
    echo "Disk usage is at ${disk_usage}%! Exceeds the threshold of $threshold%" | mail -s "Disk Usage Alert" user@example.com
fi


