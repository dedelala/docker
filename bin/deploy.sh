#!/bin/bash

img=$1
[[ -n $img ]] || { echo "usage: $0 <img>"; exit 2; }
[[ -n $DOCKER_USERNAME ]] || { echo "$0: missing DOCKER_USERNAME"; exit 2; }
[[ -n $DOCKER_PASSWORD ]] || { echo "$0: missing DOCKER_PASSWORD"; exit 2; }

if ! docker login -u "$DOCKER_USERNAME" --password-stdin <<< "$DOCKER_PASSWORD"; then
        echo "docker login failed"
        exit 1
fi

docker push "$img"
