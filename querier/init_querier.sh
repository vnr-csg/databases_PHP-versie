#!/bin/sh
echo "Importing/resetting MySQL databases.."
./reset_dbs.sh
echo "Downloading Node.js packages.."
npm ci
echo "Starting Querier.."
node querier.js
