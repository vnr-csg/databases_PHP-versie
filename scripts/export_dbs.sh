#!/bin/sh
# Exports (dumps) all databases to the database directory in .sql format 
mysql -s -r -uroot -e 'show databases' -N | while read db_name; do
    if ! echo "mysql information_schema performance_schema sys" | grep -w $db_name > /dev/null; then
        echo "Exporting $db_name.."
        mysqldump -uroot --complete-insert --single-transaction --compact "$db_name" > "./databases/$db_name".sql; 
    fi
done