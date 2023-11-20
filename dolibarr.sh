#!/bin/bash
docker run -p 80:80 \
	--name Dolibarr_CRM \
	--env DOLI_DB_HOST=SQL_Server -d \
	--env DOLI_DB_NAME=dolibarr \
	--network=sae51 \
	upshift/dolibarr
