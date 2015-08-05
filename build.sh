#!/usr/bin/env bash
set -o errexit

# Set script directory path
SCRIPT_DIR="$(dirname $(readlink -f ${0}))"

# Build the image
docker build --force-rm --pull --tag phlak/syncthing-dev ${SCRIPT_DIR}
