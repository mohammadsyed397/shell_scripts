#!/bin/bash

# Service name
service_name="myapp"

# Check if the service is running
if ! systemctl is-active --quiet "$service_name"; then
    echo "$service_name is down. Restarting..."
    # Restart the service
    sudo systemctl restart "$service_name"
else
    echo "$service_name is running."
fi

