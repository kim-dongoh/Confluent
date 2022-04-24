#!/bin/bash

rm -rf ./security/keypair
rm -rf ./.env

docker-compose down --volumes
