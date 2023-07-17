-- Active: 1689366122118@@127.0.0.1@3306@ecommerce
CREATE TABLE client (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(10),
    middleName CHAR(3),
    lastName VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(30), 
    CONSTRAINT UNIQUE_CPF_CLIENT UNIQUE (CPF)
);