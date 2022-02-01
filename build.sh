#!/usr/bin/env bash

readonly IMAGE_NAME='scottg489/metadiff-build:latest'
readonly ID_RSA=$1

read -r -d '' JSON_BODY <<- EOM
  {
  "ID_RSA": "$ID_RSA"
  }
EOM

curl -v -k -sS -w '\n%{http_code}' \
  --data-binary "$JSON_BODY" \
  "http://api.conjob.io/job/run?image=$IMAGE_NAME" \
  | tee /tmp/foo \
  | sed '$d' && \
  [ "$(tail -1 /tmp/foo)" -eq 200 ]
