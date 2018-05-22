#!/bin/bash
set -e

__build_master_image() {
  echo "Building branch image"

  if [ "$BRANCH" == "master" ]; then
    if [ -z "$HUB_REPO" ]; then
      echo "HUB_REPO required to build image, exiting"
      exit 1
    fi

    local cansible_image="$HUB_REPO:master"
    echo "Building $cansible_image"
    sudo docker build --no-cache --tag "$cansible_image" -f Dockerfile .
    sudo docker push "$cansible_image"
  else
    echo "Skipping non-master branch image build and push"
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
  if [ ! -z "$IS_PULL_REQUEST" ] && [ "$IS_PULL_REQUEST" == true ]; then
    echo "Pull request build, skipping image build and push"
  else
    __build_master_image
    __build_release_image
  fi
}

main
