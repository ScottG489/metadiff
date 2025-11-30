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
declare -r _RUN_TASK=$(jq -r .RUN_TASK <<< "$1")
declare -r _GIT_BRANCH=$(jq -r .GIT_BRANCH <<< "$1")

if [ ! -d "$_PROJECT_NAME" ]; then
  git clone --branch $_GIT_BRANCH $_GIT_REPO
fi
cd $_PROJECT_NAME

build_test

[ "$_RUN_TASK" != "deploy" ] && exit 0

push_application
