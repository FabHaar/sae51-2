#!/bin/bash

docker build -t cron_save -f cron/Dockerfile .

docker run -d \
	--name cron_backup \
	-v dolibarr_docs:/var/www/documents \
	cron_save

#--network=sae51 \
