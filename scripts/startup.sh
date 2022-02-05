#!/bin/bash
# Startup script to initialize the repository
figlet Databases
echo "\nDatabases met PHP, MySQL"
echo "Door: Rijk van Putten\n"

echo "Starting Apache HTTP server.."               
./scripts/start_apache.sh

echo "Starting MySQL server.."               
./scripts/start_mysql.sh > /dev/null


echo "Starting querier.."
cd ./querier
./init_querier.sh > /dev/null
node querier

echo "==================================="
echo "Apache HTTP | http://localhost:8001"
echo "SQL Querier | http://localhost:1700"
echo "==================================="