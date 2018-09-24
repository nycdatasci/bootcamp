#!/bin/bash

db=movies_db
echo "create database"
mysql -e "DROP DATABASE IF EXISTS $db;CREATE DATABASE $db;"
echo "restore tables"
mysql $db < movies_load.sql
