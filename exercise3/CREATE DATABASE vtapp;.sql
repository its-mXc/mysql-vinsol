CREATE DATABASE vtapp;

CREATE USER 'vtapp_user'@'localhost' IDENTIFIED BY 'vinsol';

GRANT SELECT ON vtapp . * TO 'vtapp_user'@'localhost';

FLUSH PRIVILEGES;