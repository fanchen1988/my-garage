#! /bin/bash

source ./VERSION
LOG_PATH="/tmp/logstash/*.log"
docker run -i --rm=true \
    --privileged=true \
    -p 9600:9600 \
    -e "LOG_PATH=${LOG_PATH}" \
    -t $IMAGE:$VERSION /bin/bash
