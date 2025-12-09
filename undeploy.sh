#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Deleting Kubernetes resources..."

kubectl delete -f /home/mahima/Music/frontend/ --wait=true

echo "All frontend resources have been deleted."