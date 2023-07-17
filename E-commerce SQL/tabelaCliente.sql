CREATE TABLE client (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(10),
    middleName CHAR(3),
    lastName VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    address VARCHAR() -- Parei aqui
    CONSTRAINT UNIQUE_CPF_CLIENT UNIQUE (CPF)
);