#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null; then
    echo "kubectl could not be found. Please install it to continue."
    exit 1
fi

echo "Applying Kubernetes manifests..."

kubectl apply --recursive -f "$(dirname "$0")" --filename-pattern='*.yaml' --filename-pattern='*.yml' --prune -l app.kubernetes.io/part-of=frontend

echo "Deployment complete. Use 'kubectl get service frontend-service' to find the external IP."