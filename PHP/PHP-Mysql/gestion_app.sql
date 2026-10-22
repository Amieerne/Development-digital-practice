CREATE DATABASE gestion_app;

USE gestion_app;

CREATE TABLE utilisateurs(

    id INT AUTO_INCREMENT PRIMARY KEY,

    username VARCHAR(100),

    email VARCHAR(150),

    password VARCHAR(255)

);

CREATE TABLE clients(

    id INT AUTO_INCREMENT PRIMARY KEY,

    nom VARCHAR(100),

    tel VARCHAR(30),

    ville VARCHAR(100)

);