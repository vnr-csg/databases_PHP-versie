#!/bin/bash
# Startup script to initialize the repository
bold=$(tput bold)
normal=$(tput sgr0)
figlet Databases
echo "\n${bold}Databases Module met PHP en MySQL"
echo "${normal}Deze repository is voor je klaargezet door ${bold}Rijk van Putten${normal} 😃\n"

echo "Even geduld graag terwijl de volgende dingen worden voorbereid:"
echo "(1/5) Apache HTTP server starten.."               
./scripts/start_apache.sh > /dev/null

echo "(2/5) MySQL server starten.."               
./scripts/start_mysql.sh > /dev/null

echo "(3/5) phpMyAdmin installeren.."               
./scripts/install_phpmyadmin.sh > /dev/null 2>&1

echo "(4/5) SQL Querier installeren en opstarten.."
./scripts/init_querier.sh > /dev/null
pkill -f "querier"
node querier > /dev/null &

echo "(5/5) Databases importeren.."
./scripts/import_dbs.sh > /dev/null

echo "Klaar! (hopelijk duurde het niet te lang)"

echo "\nJe Gitpod workspace is klaar voor gebruik!\nDruk op ${bold}http://localhost:8001${normal} om naar het lesmateriaal te gaan en je websites te bekijken."
