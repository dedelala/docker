#!/bin/bash

h="sheep.$HOST"
xhost "+local:$h"

docker run --rm \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix:0 \
  --device /dev/dri \
  --name sheep \
  --hostname "$h" \
  sheep:latest

