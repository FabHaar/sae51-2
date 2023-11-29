CREATE USER 'cron'@'localhost' IDENTIFIED BY 'cron';

GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'cron'@'localhost';

GRANT SHOW DATABASES, LOCK TABLES, SELECT ON `dolibarr`.* TO 'cron'@'localhost';

FLUSH PRIVILEGES;
