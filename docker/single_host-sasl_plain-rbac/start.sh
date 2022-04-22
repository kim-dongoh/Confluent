#!/usr/bin/env bash

# Generating public and private keys for token signing
echo "Generating public and private keys for token signing"
mkdir -p ./security/keypair
openssl genrsa -out ./security/keypair/keypair.pem 2048
openssl rsa -in ./security/keypair/keypair.pem -outform PEM -pubout -out ./security/keypair/public.pem

# Bring up base kafka cluster
docker-compose up --no-recreate -d zookeeper1 kafka1 kafka2 control-center
