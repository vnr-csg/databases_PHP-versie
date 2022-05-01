#!/bin/bash
# Startup script to initialize the repository
bold=$(tput bold)
normal=$(tput sgr0)
figlet Databases Omgeving
echo "\n${bold}Databases Omgeving"
echo "${normal}Deze Gitpod-workspace is voor je klaargezet door ${bold}Rijk van Putten${normal} 😃\n"

./scripts/start_apache.sh > /dev/null

./scripts/start_mysql.sh > /dev/null

echo "Databases worden geïmporteerd (dit kan even duren).."
start=`date +%s`
./scripts/import_dbs.sh > /dev/null
end=`date +%s`
runtime=$( echo "$end - $start" | bc -l )
echo "Klaar! Geïmporteerd in $runtime seconden. (hopelijk duurde het niet te lang)"

echo "\nJe Gitpod workspace is klaar voor gebruik!\nDruk op ${bold}http://localhost:8001${normal} om naar het lesmateriaal te gaan en je websites te bekijken."
