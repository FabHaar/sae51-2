# Installation d'un ERP/CRM

#### fait par Haar Fabien et Sofianos Lucas
groupe FI
<div align="right">le 22/11/2023 </div>

## Points clés

### 1 : 
`localhost`

### 2 : 
test from replit
## Troubleshooting : 

le troubleshooting

Troubleshoot la première journée, 
Première implémentation dockerisé : solution BDD -- Dolibarr et ses dépendances

(passer de docker compose avec mariaDB à docker run sur mysql et le reste)

Première esssai d'implementation en suivant https://github.com/upshift-docker/dolibarr pour la creation d'un docker-compose permettant l'implementation de dolibarr.
le fichier docker-compose.yml permettait en théorie de faire l'installation de mariadb dans une conteneur paramètrer de sorte qu'il y est création de base de donnée, une communication directe avec le second conteneur créee, celui d'une image dolibarr modifier pour permettre de manipuler l'installation avec des variable pour la preset, ainsi que toute les solutions nécessaire embarquer au fonctionnement de dolibarr (apache2, serveur php...) . 
finalement cette solution ne fonctionnais pas complétement alors nous l'avons adapter en reprenant tout d'abord, une base de donnée mysql comme le projet précédent, mais aussi en ne passant plus par un docker-compose.yml mais simplement avec un script pour lancer 2 conteneurs (docker run ...)
[photo différence docker-compose.yml avec notre implémentation ???]

(problème de connection entre le dolibarr et mysql --> solution, ajout de network entre les 2)

Le second problème est intervenu à la suite du première essai, grâce au logs de docker nous avons pu voir que la connection entre la base de donnée mysql et le conteneur dolibarr ne s'effectuais pas correctement, pour conséquence dolibarr ne pouvais pas persister et fonctionner correctement.
La solution à été de rajouter un réseau entre les 2 conteneurs afin de leur premettre la connection mutuel (une erreur qui était présente d'origine dans le fichier docker-compose.yml fournie précédemment)
[mettre la commande de création de network]

(enfin, problème de création de la Database avec la variable env MYSQL_DATABASE qui n'étais pas prise en compte --> solution, crée la database grâce à l'envoie d'une requete)

Pour finir, nous avions une erreur lors de la récupération par dolibarr de la base de donnée appelé "dolibarr" (nom dolibarr inconnu) pour cause elle n'était pas correctement crée.
Malgré l'utilisation de la variable d'environnement MYSQL_DATABASE qui est censé permettre la création de la base de donnée à l'initialisation du SGBD, la base de donnée n'étais pas présente, la variable n'était pas prise en compte comparé aux autres variables présentes permettant d'autre paramétrage.
La solution à été d'utiliser une autre méthode pour effectuer l'implémentation de la base donnée, par l'envoie d'une requete pour effectuer la création de la base de donnée "dolibarr"
[mettre la requete...] 

