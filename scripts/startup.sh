#!/bin/bash
# Startup script. Initializes MySQL and Node.js
echo "
 ____        _        _                         
|  _ \  __ _| |_ __ _| |__   __ _ ___  ___  ___ 
| | | |/ _` | __/ _` | '_ \ / _` / __|/ _ \/ __|
| |_| | (_| | || (_| | |_) | (_| \__ \  __/\__ \
|____/ \__,_|\__\__,_|_.__/ \__,_|___/\___||___/
Databases met PHP, MySQL
Door: Rijk van Putten
"

echo "Starting MySQL server.."               
./scripts/start_mysql.sh


cd ./querier
echo "Importing/resetting MySQL databases.."
./reset_dbs.sh
echo "Downloading Node.js packages.."
npm ci
echo "Starting Querier.."
node querier.js
