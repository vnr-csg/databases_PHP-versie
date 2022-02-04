#!/bin/bash
# Startup script to initialize the repository
figlet Databases
echo "Databases met PHP, MySQL"
echo "Door: Rijk van Putten"

echo "Starting MySQL server.."               
./scripts/start_mysql.sh


cd ./querier
echo "Init querier.."
./init_querier.sh