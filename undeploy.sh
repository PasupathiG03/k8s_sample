#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null; then
    echo "kubectl could not be found. Please install it to continue."
    exit 1
fi

echo "Deleting Kubernetes resources..."

kubectl delete --recursive -f "$(dirname "$0")" --filename-pattern='*.yaml' --filename-pattern='*.yml' --wait=true

echo "All frontend resources have been deleted."