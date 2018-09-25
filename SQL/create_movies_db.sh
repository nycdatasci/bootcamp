#!/bin/bash

db=movies_db
echo "creating database"
mysql -e "DROP DATABASE IF EXISTS $db;CREATE DATABASE $db;"
echo "loading tables"
mysql $db < movies_load.sql
mysql -e "SHOW TABLES FROM $db;"
