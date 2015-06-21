#!/usr/bin/env bash
set -o errexit -o pipefail


## SCRIPT VARIABLES
########################################

if [[ -z "${ST_DIR}" ]]; then
    echo "ERROR: SYNCTHING_DIR environment variable not set"; exit 1
fi


## SCRIPT ACTIONS
########################################

if [[ ! -z ${ST_AUTH} ]]; then
    AUTH_ARG="-gui-authentication=${ST_AUTH}"
fi

${ST_DIR}/syncthing \
    -gui-address=0.0.0.0:80 \
    ${AUTH_ARG} \
    -home="${ST_DIR}"
    -no-browser
