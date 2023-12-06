# Installation d'un ERP/CRM

#### Fait par Haar Fabien et Sofianos Lucas
Groupe FI
<div align="right">le 22/11/2023 </div>

# Points clés

## 1 Description de l'architecture conteneurisé mise en place : 
| **Conteneurs** |                 **Conteneur Dolibarr**                |                        **Conteneur mysql**                        |                 **Conteneur cron**                 |
|:--------------:|:-----------------------------------------------------:|:-----------------------------------------------------------------:|:--------------------------------------------------:|
|    **Image**   |                    upshift/dolibarr                    |                               mysql                               | cron_save (personalisée à partir d'un image ubuntu) |
|  **Fonction** | Logiciel Dolibarr accessible depuis une interface web | Base de données permettant à Dolibarr de focntionner correctement |         Serveur de sauvegarde hebdomadaire         |

Le script `install.sh` lance dans l'ordre :
- Le conteneur mysql :<br>
`docker run --name SQL_Server \`<br>
`-p 3306:3306 \`<br>
`-v dolibarr_db:/var/lib/mysql \`<br>
`--env MYSQL_ROOT_PASSWORD=foo \`<br>
`--env MYSQL_USER=dolibarr \`<br>
`--env MYSQL_PASSWORD=dolibarr \`<br>
`--env MYSQL_DATABASE=dolibarr \`<br>
`--env character_set_client=utf8 \`<br>
`--env character-set-server=utf8mb4 \`<br>
`--env collation-server=utf8mb4_unicode_ci \`<br>
`-network=sae51 \`<br>
`-d mysql`
- Le conteneur Dolibarr :

## 2 : 


# Troubleshooting : 
## Probleme 1 :
Première implémentation dockerisé : solution BDD -- Dolibarr et ses dépendances

(passer de docker compose avec mariaDB à docker run sur mysql et le reste)

Premier esssai d'implémentation en suivant https://github.com/upshift-docker/dolibarr pour la creation d'un docker-compose permettant l'implementation de dolibarr.
Le fichier docker-compose.yml permettait en théorie de faire l'installation de mariadb dans une conteneur paramètrer de sorte qu'il y est création de base de donnée, une communication directe avec le second conteneur créee, celui d'une image dolibarr modifier pour permettre de manipuler l'installation avec des variable pour la preset, ainsi que toute les solutions nécessaire embarquer au fonctionnement de dolibarr (apache2, serveur php...) . 
finalement cette solution ne fonctionnait pas complétement alors nous l'avons adapté en reprenant tout d'abord, une base de donnée mysql comme le projet précédent, mais aussi en ne passant plus par un docker-compose.yml mais simplement avec un script pour lancer 2 conteneurs (docker run ...)
[photo différence docker-compose.yml avec notre implémentation ???]

## Probleme 2 :
(problème de connection entre le dolibarr et mysql --> solution, ajout de network entre les 2)

Le second problème est intervenu à la suite du première essai, grâce au logs de docker nous avons pu voir que la connection entre la base de donnée mysql et le conteneur dolibarr ne s'effectuait pas correctement, par conséquence dolibarr ne pouvais pas fonctionner.
La solution à été de rajouter un réseau entre les 2 conteneurs afin de leur premettre la connection mutuel (une erreur qui était présente d'origine dans le fichier docker-compose.yml fournie précédemment) <br>
Nous avons donc utiliser dans le script `install.sh` la commande :<br> 
`docker network create sae51`<br>
Et lors de la création de chaque conteneur, spécifier l'option : <br>
`--network=sae51`

## Probleme 3 :
(enfin, problème de création de la Database avec la variable env MYSQL_DATABASE qui n'étais pas prise en compte --> solution, crée la database grâce à l'envoie d'une requete)

Pour finir, nous avions une erreur lors de la récupération par dolibarr de la base de données appelé "dolibarr" (nom dolibarr inconnu) pour cause elle n'était pas correctement créée.
Malgré l'utilisation de la variable d'environnement MYSQL_DATABASE qui est censé permettre la création de la base de donnée à l'initialisation du SGBD, la base de données n'était pas présente, la variable n'était pas prise en compte comparé aux autres variables d'environnement présentes permettant d'autre paramétrages.
La solution à été d'utiliser une autre méthode pour effectuer l'implémentation de la base données, par l'envoie d'une requete pour effectuer la création de la base de données "dolibarr" : <br>
`CREATE DATABASE dolibarr`

## Probleme 4 :

Cron

## Probleme 5 :

Imprtation des csv
