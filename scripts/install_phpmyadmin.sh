#!/bin/sh
# Installs the latest stable phpMyAdmin from the git repository

mkdir public -p
cd public
git clone https://github.com/phpmyadmin/phpmyadmin.git --depth 1 --branch STABLE
cd phpmyadmin
composer update --no-dev
yarn install
cp ../../config.inc.php .
