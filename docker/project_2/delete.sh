#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"


docker-compose down --volumes

docker rm -f $(docker ps -aq)
docker rmi -f $(docker images)


(cd "${DIR}/kafkaDir/data/" && rm -rf *)
(cd "${DIR}/zookeeperDir/data/" && rm -rf *)
(cd "${DIR}/zookeeperDir/log/" && rm -rf *)
