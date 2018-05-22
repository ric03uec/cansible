#!/bin/bash
set -e

__build_branch_image() {
  echo "Building branch image"
  if [ "$BRANCH" == "master" ]; then
    export CANSIBLE_IMAGE="$HUB_REPO:$BUILD_NUMBER"
    echo "$CANSIBLE_IMAGE"
    echo "docker build image"
    echo "docker push image"
  else
    echo "Building non-master branch, skipping image push"
  fi
}

__build_release_image() {
  echo "Building release image"
  if [ ! -z "$IS_RELEASE" ] && [ "$IS_RELEASE" == true ]; then
    echo "Release build for: $RELEASE_NAME"
    echo "build docekr image for this release"
    echo "push docker image for this release"
    echo "update docker hub documentation"
  fi
}

main() {
  __build_branch_image
  __build_release_image
}

main
