#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source ${DIR}/helper/functions.sh
source ${DIR}/env.sh

# Generating public and private keys for token signing
echo "Generating public and private keys for token signing"
mkdir -p ./security/keypair
openssl genrsa -out ./security/keypair/keypair.pem 2048
openssl rsa -in ./security/keypair/keypair.pem -outform PEM -pubout -out ./security/keypair/public.pem

# Bring up tools
build_tools_image

docker-compose up --no-recreate -d tools

# Bring up base kafka cluster
docker-compose up --no-recreate -d zookeeper1 kafka1 kafka2 control-center
