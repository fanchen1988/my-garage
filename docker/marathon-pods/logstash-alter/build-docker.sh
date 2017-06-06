#! /bin/bash

source ./VERSION
docker build --rm=true \
    -t $IMAGE:$VERSION .
