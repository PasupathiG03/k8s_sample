#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null; then
    echo "kubectl could not be found. Please install it to continue."
    exit 1
fi

echo "Applying Kubernetes manifests..."

# Find all .yaml and .yml files, excluding docker-compose.yml, and apply them.
# This is a more compatible way to apply multiple files than using --filename-pattern.
find "$(dirname "$0")" \( -name "*.yaml" -o -name "*.yml" \) -not -name "docker-compose.yml" -print0 | \
  xargs -0 -I {} kubectl apply -f {}

echo "Deployment complete. Use 'kubectl get service frontend-service' to find the external IP."