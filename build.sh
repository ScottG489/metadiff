#!/usr/bin/env bash

readonly RUN_TASK=$1
readonly ID_RSA=$2
readonly DOCKER_CONFIG=$3
readonly GIT_BRANCH=${GITHUB_HEAD_REF:-$GITHUB_REF_NAME}
readonly IMAGE_TAG=$([[ $GIT_BRANCH == "master" ]] && echo -n "latest" || sed 's/[^a-zA-Z0-9]/-/g' <<< "$GIT_BRANCH")
readonly IMAGE_NAME="scottg489/metadiff-build:$IMAGE_TAG"

read -r -d '' JSON_BODY <<- EOM
  {
  "ID_RSA": "$ID_RSA",
  "DOCKER_CONFIG": "$DOCKER_CONFIG",
  "RUN_TASK": "$RUN_TASK",
  "GIT_BRANCH": "$GIT_BRANCH"
  }
EOM

curl -v -k -sS -w '\n%{http_code}' \
  --data-binary "$JSON_BODY" \
  "http://api.conjob.io/job/run?image=$IMAGE_NAME" \
  | tee /tmp/foo \
  | sed '$d' && \
  [ "$(tail -1 /tmp/foo)" -eq 200 ]
