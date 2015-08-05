#!/usr/bin/env bash
set -o errexit

# Set the image name
IMAGE_NAME="phlak/syncthing"

# Set script directory path
SCRIPT_DIR="$(dirname $(readlink -f ${0}))"

# Set tag from git commit hash
TAG="$(git rev-parse --short HEAD)"

# Build the image
docker build --force-rm --pull --tag ${IMAGE_NAME}:${TAG} ${SCRIPT_DIR}

# Notify user of success
echo "Sucessfully created image: ${IMAGE_NAME}:${TAG}"
