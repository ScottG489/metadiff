#!/bin/bash
set -e

get_git_root_dir() {
  echo -n "$(git rev-parse --show-toplevel)"
}

setup_credentials() {
  set +x
  local ID_RSA_CONTENTS
  local DOCKER_CONFIG_CONTENTS

  readonly ID_RSA_CONTENTS=$(echo -n "$1" | jq -r .ID_RSA | base64 --decode)
  readonly DOCKER_CONFIG_CONTENTS=$(echo -n "$1" | jq -r .DOCKER_CONFIG | base64 --decode)
  [[ -n $ID_RSA_CONTENTS ]]
  [[ -n $DOCKER_CONFIG_CONTENTS ]]

  printf -- "$ID_RSA_CONTENTS" >/root/.ssh/id_rsa
  printf -- "$DOCKER_CONFIG_CONTENTS" >/root/.docker/config.json

  chmod 400 /root/.ssh/id_rsa
}

build_push_application() {
  local ROOT_DIR
  readonly ROOT_DIR=$(get_git_root_dir)
  cd "$ROOT_DIR"

  ./gradlew --info build install

  docker build -t scottg489/metadiff:latest .
  docker push scottg489/metadiff:latest
}
