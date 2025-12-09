#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null; then
    echo "kubectl could not be found. Please install it to continue."
    exit 1
fi

# This script checks the status of the frontend service.
# Using "watch" will refresh the command every 2 seconds, which is useful
# when waiting for an EXTERNAL-IP to be assigned by the cloud provider.

echo "Watching service status... (Press Ctrl+C to exit)"
echo "------------------------------------------------"

watch kubectl get service frontend-service