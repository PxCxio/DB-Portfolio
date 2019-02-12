mysql -u root -p <<"EOF"

DROP DATABASE IF EXISTS cts4348;

CREATE DATABASE cts4348 CHARACTER SET utf8 COLLATE utf8_general_ci;

use cts4348;

CREATE TABLE users (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(30) NOT NULL,
password VARCHAR(300) NOT NULL,
gender VARCHAR(30) NOT NULL,
title VARCHAR(30) NOT NULL,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL,
address VARCHAR(300) NOT NULL,
city VARCHAR(300) NOT NULL,
state VARCHAR(300) NOT NULL,
zip int(8) UNSIGNED,
email VARCHAR(50),
telephone VARCHAR(30),
birthday DATE,
zodiac int(6) UNSIGNED,
occupation VARCHAR(300)
);

ALTER TABLE users AUTO_INCREMENT=1001;

CREATE TABLE zodiac (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL
);

ALTER TABLE zodiac AUTO_INCREMENT=101;

INSERT INTO zodiac(name) VALUES ('Aries'), ('Taurus'), ('Gemini'), ('Cancer'), ('Leo'), ('Virgo'), ('Libra'), ('Scorpio'), ('Sagittarius'), ('Capricorn'), ('Aquarius'), ('Pisces');

alter table users add CONSTRAINT fk_zodiac FOREIGN KEY (zodiac) REFERENCES zodiac (id)
on DELETE NO ACTION 
on UPDATE NO ACTION ;


CREATE TABLE firewallLogs (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`timestamp` TIMESTAMP NOT NULL,
sourceIP VARCHAR(15) NOT NULL,
sourcePort int(5) UNSIGNED NOT NULL,
destinationPort int(5) UNSIGNED NOT NULL
);

CREATE TABLE services (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
port INT(5) NOT NULL,
name VARCHAR(40) NOT NULL
);

COMMIT;

EOF


