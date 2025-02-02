#!/bin/bash

# Set the threshold for CPU usage
threshold=80
# Get the current CPU usage percentage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Check if CPU usage exceeds the threshold
if [ $(echo "$cpu_usage > $threshold" | bc) -eq 1 ]; then
    # Trigger scaling operation (e.g., using AWS CLI to scale up)
    echo "CPU usage is $cpu_usage%. Scaling up..."
    # aws autoscaling start-instance --instance-id <instance-id>
else
    echo "CPU usage is at $cpu_usage%. No scaling needed."
fi

