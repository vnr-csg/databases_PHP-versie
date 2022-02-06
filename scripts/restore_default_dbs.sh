#!/bin/bash

for db_path in ./databases_default/*.sql;
do
    db_file=$(basename $db_path)
    target_path="./databases/$db_file"
    echo "Restore $db_file." 
    cp $db_path $target_path
done

./scripts/import_dbs.sh
