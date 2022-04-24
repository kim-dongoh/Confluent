#!/bin/bash



build_tools_image()
{
  echo
  echo "Building custom Docker tools image with version ${CONFLUENT_DOCKER_TAG}"

  local DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

  DOCKERFILE="${DIR}/../../tools/Dockerfile-tools"
  CONTEXT="${DIR}/../../."
  echo "docker build -t localbuild/tools:${CONFLUENT_DOCKER_TAG} -f $DOCKERFILE $CONTEXT"
  docker build -t localbuild/tools:${CONFLUENT_DOCKER_TAG} -f $DOCKERFILE $CONTEXT || {
    echo "ERROR: Docker tools image build failed. Please troubleshoot and try again. For troubleshooting instructions see https://docs.confluent.io/platform/current/tutorials/cp-demo/docs/troubleshooting.html"
    exit 1
  }
}
