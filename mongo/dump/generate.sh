#!/usr/bin/env bash
set -e

MONGO_DATABASE="${MONGO_DATABASE:-hercules_database}"
MONGO_USERNAME="${MONGO_USERNAME:-test}"
MONGO_PASSWORD="${MONGO_USERNAME:-test}"

mongodump \
    --username ${MONGO_USERNAME} \
    --password ${MONGO_PASSWORD} \
    --authenticationDatabase admin \
    --db ${MONGO_DATABASE} \
    --out /dump/data
