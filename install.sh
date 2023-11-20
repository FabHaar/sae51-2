#!/bin/bash

#ETAPE 2 : creation des volumes nécessaire
docker volume create dolibarr_db
docker volume create dolibarr_html
docker volume create dolibarr_docs

docker network create sae51

#ETAPE 2 : creation du conteneur SGBD
docker run --name SQL_Server \
	-p 3306:3306 \
	-v dolibarr_db:/var/lib/mysql \
	--env MYSQL_ROOT_PASSWORD=foo \
	--env MYSQL_USER=dolibarr \
	--env MYSQL_PASSWORD=dolibarr \
	--env MYSQL_DATABASE=dolibarr \
	--env character_set_client=utf8 \
	--env character-set-server=utf8mb4 \
	--env collation-server=utf8mb4_unicode_ci \
	--network=sae51 \
	-d mysql


sleep 5 #attente de 5 secondes pour être sûr que le sgbd soit accessible


