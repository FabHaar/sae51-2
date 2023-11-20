#!/bin/bash
docker run -p 80:80 \
	--name Dolibarr_CRM \
	--env DOLI_DB_HOST=SQL_Server -d \
	--network=sae51 \
	upshift/dolibarr
