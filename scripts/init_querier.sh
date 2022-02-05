#!/bin/sh
echo "Importing/resetting MySQL databases.."
./scripts/reset_dbs.sh
echo "Downloading Node.js packages.."
cd querier && npm ci
