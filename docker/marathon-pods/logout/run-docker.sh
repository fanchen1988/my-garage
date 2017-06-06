#! /bin/bash

source ./VERSION
LOG_PATH="/tmp/logstash/time.log"
docker run -i --rm=true \
    --privileged=true \
    -e "LOG_PATH=${LOG_PATH}" \
    -t $IMAGE:$VERSION /bin/bash
