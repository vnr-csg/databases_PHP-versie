#!/bin/bash
# Startup script to initialize the repository
bold=$(tput bold)
normal=$(tput sgr0)
figlet Databases
echo "\n${bold}Databases Module met PHP en MySQL"
echo "${normal}Deze repository is voor je klaargezet door ${bold}Rijk van Putten${normal} 😃\n"

echo "Even geduld graag terwijl de volgende dingen worden voorbereid:"

echo "Servers aan het opstarten.."
./scripts/start_apache.sh > /dev/null
./scripts/start_mysql.sh > /dev/null

echo "Databases aan het importeren.."
./scripts/import_dbs.sh > /dev/null


echo "Klaar! (hopelijk duurde het niet te lang)"

echo "\nJe Gitpod workspace is klaar voor gebruik!\nDruk op ${bold}http://localhost:8001${normal} om naar het lesmateriaal te gaan en je websites te bekijken."
