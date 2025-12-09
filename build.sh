#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo "docker could not be found. Please install it to continue."
    exit 1
fi

# --- Configuration ---
# Local Docker Registry (running on localhost:5000)
REGISTRY_HOST="localhost:5000"
IMAGE_NAME="frontend"
TAG=${1:-"latest"}

FULL_IMAGE_NAME="${REGISTRY_HOST}/${IMAGE_NAME}:${TAG}"

# --- Build ---
echo "Building image: ${FULL_IMAGE_NAME}"
docker build -t "${FULL_IMAGE_NAME}" .

echo ""
echo "Build complete for ${FULL_IMAGE_NAME}"
echo ""

# --- Push to Local Registry ---
echo "Pushing image to local registry..."
if docker push "${FULL_IMAGE_NAME}"; then
    echo "Push successful!"
    echo "Image is now available at: ${FULL_IMAGE_NAME}"
else
    echo "Push failed. Make sure:"
    echo "1. Local Docker registry is running on localhost:5000"
    echo "2. Run: docker run -d -p 5000:5000 --restart=always --name registry registry:2"
    exit 1
fi