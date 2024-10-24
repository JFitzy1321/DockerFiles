#!/bin/bash

# If you're on windows, you can run this from git bash
IMAGE_TAG="joefitzgibbons1/tpt-node-chrome:1.0"

echo "Building docker image $IMAGE_TAG" && \
docker build --rm --no-cache --tag $IMAGE_TAG -f tpt-node-chrome.dockerfile . && \

[[ $1 == "--run" ]] && echo "Running docker image $IMAGE_TAG" && \
docker run --rm -it  joefitzgibbons1/tpt-node-chrome:1.0 && exit 0 || \

[[ $1 == "--no-push" || $2 == "--no-push" ]] && exit 0 || \

echo "Pushing $IMAGE_TAG to DockerHub" && \
docker push $IMAGE_TAG
