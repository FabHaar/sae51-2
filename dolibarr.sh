#!/bin/bash
docker run -p 80:80 \
	--env DOLI_DB_HOST=SQL_Server -d \
	upshift/dolibarr
