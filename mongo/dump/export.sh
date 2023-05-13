#!/usr/bin/env bash
set -e

MONGO_DATABASE="${MONGO_DATABASE:-hercules_database}"
MONGO_USERNAME="${MONGO_USERNAME:-test}"
MONGO_PASSWORD="${MONGO_USERNAME:-test}"
MONGO_COLLECTION="Fixture"

mongoexport \
    --username ${MONGO_USERNAME} \
    --password ${MONGO_PASSWORD} \
    --authenticationDatabase admin \
    --db ${MONGO_DATABASE} \
    --collection ${MONGO_COLLECTION} \
    --pretty \
    --out /dump/exported/${MONGO_COLLECTION}.jsonlines
