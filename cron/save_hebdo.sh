#!/bin/bash

mysqldump -u root -p'foo' -h 127.0.0.1 --port=3306 dolibarr > /var/www/documents/save.sql

#mysqldump -u cron -p'cron' -h 127.0.0.1 --port=3306 dolibarr > /var/www/documents/save.sql
#il faudra rendre active la ligne commenté au lieu de faire avec root
