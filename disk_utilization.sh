#!/bin/bash
# This script is used to check the disk utilization

# Get the disk usage percentage for /dev/root
disk_size=$(df -h | grep '/dev/root' | awk '{print $5}' | cut -d '%' -f1)

# Check if disk usage is greater than 20%
if [ "$disk_size" -gt 20 ]; then
    echo "Disk is $disk_size%full. Please expand the disk or delete some files."
else
    echo "$disk_size% space is available."
fi
