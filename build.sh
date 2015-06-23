#!/usr/bin/env bash
set -o errexit

docker build --force-rm --no-cache --pull --tag phlak/syncthing-dev .
