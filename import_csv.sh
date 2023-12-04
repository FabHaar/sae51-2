#!/bin/bash

tail -n +2 "csv/example_export.csv" | while IFS="," read -r nom prenom;
do
	mysql -u root -p'foo' -h 127.0.0.1 --port=3306 dolibarr < sql/third_parts.sql
done
