#!/bin/bash
# Startup script to initialize the repository
figlet Databases
echo "\nDatabases met PHP, MySQL"
echo "Door: Rijk van Putten\n"

echo "Starting Apache HTTP server.."               
./scripts/start_apache.sh

echo "Starting MySQL server.."               
./scripts/start_mysql.sh


echo "Starting querier.."
cd ./querier
./init_querier.sh > /dev/null