#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check for dependencies
if ! command -v docker &> /dev/null; then
    echo "docker could not be found. Please install it to continue."
    exit 1
fi
if ! command -v docker-compose &> /dev/null; then
    echo "docker-compose could not be found. Please install it to continue."
    exit 1
fi

echo "Stopping and removing container 'shell_frontend'..."
docker stop shell_frontend || true
docker rm shell_frontend || true

echo "Cleaning up Docker resources..."
docker container prune -f
docker system prune -a -f
docker-compose -p shell_frontend down -v