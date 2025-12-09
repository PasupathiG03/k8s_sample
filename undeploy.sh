#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null; then
    echo "kubectl could not be found. Please install it to continue."
    exit 1
fi

echo "Deleting Kubernetes resources..."

# Find all .yaml and .yml files, excluding docker-compose.yml, and delete them.
find "$(dirname "$0")" \( -name "*.yaml" -o -name "*.yml" \) -not -name "docker-compose.yml" -print0 | \
  xargs -0 kubectl delete -f --wait=true

echo "All frontend resources have been deleted."