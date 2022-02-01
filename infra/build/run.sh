#!/bin/bash
set -e

source /opt/build/build_functions.sh

set +x
setup_credentials "$1"
set -x

# Start the docker daemon. This is necessary when using the sysbox-runc container runtime rather than mounting docker.sock
dockerd > /var/log/dockerd.log 2>&1 &
sleep 3

declare -r _PROJECT_NAME='metadiff'
declare -r _GIT_REPO='git@github.com:ScottG489/metadiff.git'

git clone $_GIT_REPO
cd "$_PROJECT_NAME"

build_push_application