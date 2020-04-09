#!/bin/bash

ABSPATH="some abs folder path"
FOLDER_NAME="prototype"
BUILD_CONTEXT="$ABSPATH/pipeline/$FOLDER_NAME"
PROTO_TAG="$FOLDER_NAME:latest"
DOCKERFILE="$BUILD_CONTEXT/$FOLDER_NAME.dockerfile"

if [[ $1 == "--build-dist" ||  ! -d $BUILD_CONTEXT/dist/touchpoint-frontend ]]; then
  npm run build:proto # this should output in the correct folder

elif [[ $1 == "--no-cache" ]]; then
  docker build --rm --no-cache -f $DOCKERFILE -t $PROTO_TAG "$BUILD_CONTEXT" && \
  docker run --env-file env.list --rm -it $PROTO_TAG

else
  docker build --rm -f $DOCKERFILE -t $PROTO_TAG "$BUILD_CONTEXT" && \
  docker run --env-file env.list --rm -it $PROTO_TAG
fi