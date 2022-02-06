#!/bin/sh
# Imports all databases from the database directory
for db_path in ./databases/*.sql;
do
    db_name=$(basename $db_path .sql)
    echo "Importing '$db_name'.."
    mysql -e "DROP DATABASE IF EXISTS $db_name; CREATE DATABASE $db_name;"
    mysql --init-command="SET SESSION FOREIGN_KEY_CHECKS=0;" $db_name < $db_path
done
