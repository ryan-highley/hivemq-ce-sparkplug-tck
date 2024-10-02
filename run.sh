#!/bin/bash

BASE_NAME=hivemq-ce-sparkplug-tck

VOLUME_LIST="\
  ${BASE_NAME}-data \
  ${BASE_NAME}-log \
  "

POD_NAME=${BASE_NAME}

for vol_name in ${VOLUME_LIST}; do
  podman volume exists ${vol_name} || podman volume create ${vol_name}
done

podman run --name ${POD_NAME} \
  --replace \
  --detach \
  -p 1883:1883 \
  -p 8000:8000 \
  -v ${BASE_NAME}-data:/opt/hivemq/data:Z \
  -v ${BASE_NAME}-log:/opt/hivemq/log:Z \
  ryan_highley/hivemq-ce-sparkplug-tck:2024.6-3.0.0

