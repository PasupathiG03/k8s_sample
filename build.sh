#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo "docker could not be found. Please install it to continue."
    exit 1
fi

# --- Configuration ---
IMAGE_OWNER="mahima"
IMAGE_NAME="frontend"
TAG=${1:-"latest"}

FULL_IMAGE_NAME="${IMAGE_OWNER}/${IMAGE_NAME}:${TAG}"

# --- Build ---
echo "Building image: ${FULL_IMAGE_NAME}"
docker build -t "${FULL_IMAGE_NAME}" .

echo ""
echo "Build complete for ${FULL_IMAGE_NAME}"
echo ""
echo "Image is ready locally."
echo ""
echo "To use this image with Kubernetes:"
echo "1. If using local cluster (minikube/kind): Image is ready to use"
echo "2. If using remote cluster (EKS/GKE): Run 'docker push ${FULL_IMAGE_NAME}' after 'docker login'"