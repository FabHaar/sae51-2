#!/bin/bash

mysql -u root -p'foo' -h 127.0.0.1 --port=3306 dolibarr<< EOF
LOAD DATA INFILE 'csv/exampleexport.csv'
FIELDS TERMINATED BY ','
LINE TERMINATED BY '\n'
IGNORE 1 LINES;
EOF
