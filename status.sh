#!/bin/bash

# This script checks the status of the frontend service.
# Using "watch" will refresh the command every 2 seconds, which is useful
# when waiting for an EXTERNAL-IP to be assigned by the cloud provider.

echo "Watching service status... (Press Ctrl+C to exit)"
echo "------------------------------------------------"

watch kubectl get service frontend-service