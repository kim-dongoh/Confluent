#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"


docker-compose down --volumes

docker rm -f $(docker ps -aq)
docker rmi -f $(docker images)

(cd "${DIR}/kafkaDir/kafka1/data/" && rm -rf *)
(cd "${DIR}/kafkaDir/kafka2/data/" && rm -rf *)
(cd "${DIR}/kafkaDir/kafka3/data/" && rm -rf *)
(cd "${DIR}/zookeeperDir/zookeeper1/data/" && rm -rf *)
(cd "${DIR}/zookeeperDir/zookeeper1/log/" && rm -rf *)
(cd "${DIR}/zookeeperDir/zookeeper2/data/" && rm -rf *)
(cd "${DIR}/zookeeperDir/zookeeper2/log/" && rm -rf *)
(cd "${DIR}/zookeeperDir/zookeeper3/data/" && rm -rf *)
(cd "${DIR}/zookeeperDir/zookeeper3/log/" && rm -rf *)
