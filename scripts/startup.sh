#!/bin/bash
# Startup script to initialize the repository
bold=$(tput bold)
normal=$(tput sgr0)
figlet Databases
echo "\n${bold}Databases Module met PHP en MySQL"
echo "${normal}Deze repository is voor je klaargezet door ${bold}Rijk van Putten${normal} 😃\n"

echo "Even geduld graag terwijl de volgende dingen worden opgezet:"
echo "(1/3) Apache HTTP server.."               
./scripts/start_apache.sh > /dev/null

echo "(2/3) MySQL server.."               
./scripts/start_mysql.sh > /dev/null


echo "(3/3) SQL Querier.."
cd ./querier
./init_querier.sh > /dev/null
node querier > /dev/null &
echo "Klaar! (hopelijk duurde het niet te lang)"

echo "\nJe Gitpod workspace is klaar voor gebruik!\nDruk op ${bold}http://localhost:8001${normal} om je websites te bekijken."
