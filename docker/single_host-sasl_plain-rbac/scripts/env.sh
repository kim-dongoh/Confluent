#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source ${DIR}/../env_files/config.env

#-------------------------------------------------------------------------------

# REPOSITORY - repository (probably) for Docker images
# The '/' which separates the REPOSITORY from the image name is not required here
export REPOSITORY=${REPOSITORY:-confluentinc}

# CONNECTOR_VERSION - connector version
export CONNECTOR_VERSION=${CONNECTOR_VERSION:-$CONFLUENT}

