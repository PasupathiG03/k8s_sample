#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Applying Kubernetes manifests..."

kubectl apply -f /home/mahima/Music/frontend/

echo "Deployment complete. Use 'kubectl get service frontend-service' to find the external IP."