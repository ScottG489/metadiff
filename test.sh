#!/bin/bash
set -ex

trap cleanup EXIT
cleanup() {
  # The local fs is mounted into the container and as such any files it writes will have their permissions changed.
  #   This will change the permissions back and clean up other files we don't want hanging around.
  sudo chown -R "$(whoami)":"$(whoami)" .
}

declare ID_RSA_CONTENTS_BASE64
declare DOCKER_CONFIG_CONTENTS_BASE64
declare GIT_BRANCH

# Change the location of these files based on where they are on your system
ID_RSA_CONTENTS_BASE64=$(base64 ~/.ssh/id_rsa | tr -d '\n') ;
DOCKER_CONFIG_CONTENTS_BASE64=$(base64 ~/.docker/config.json | tr -d '\n') ;
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
[[ -n $ID_RSA_CONTENTS_BASE64 ]]
[[ -n $DOCKER_CONFIG_CONTENTS_BASE64 ]]
[[ -n $GIT_BRANCH ]]

# The local fs is mounted into the container and as such any files it writes will have their permissions changed.
#   This will change the permissions back and clean up other files we don't want hanging around.
sudo chown -R "$(whoami)":"$(whoami)" .

docker build infra/build -t metadiff-build-test && \
  docker run -it \
  --runtime=sysbox-runc \
  --volume "$PWD:/opt/build/metadiff" \
  metadiff-build-test '{"RUN_TASK": "test", "GIT_BRANCH": "'"$GIT_BRANCH"'", "ID_RSA": "'"$ID_RSA_CONTENTS_BASE64"'", "DOCKER_CONFIG": "'"$DOCKER_CONFIG_CONTENTS_BASE64"'"}'
