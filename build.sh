#!/bin/bash
set -e

main() {
	if [ "$BRANCH" == "master" ]; then
		export CANSIBLE_IMAGE="$HUB_REPO:$BUILD_NUMBER"
		echo $CANSIBLE_IMAGE
		echo "docker build image"
		echo "docker push image"
	else
		echo "Building non-master branch, skipping image push"
	fi
}

main
