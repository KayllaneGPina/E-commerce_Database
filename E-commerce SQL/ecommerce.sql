-- tabela Cliente
CREATE TABLE Clientes (
    idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Pnome VARCHAR(10) NOT NULL,
    NomeMeio VARCHAR(3),
    Sobrenome VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Endereco VARCHAR(255),
    CONSTRAINT UNIQUE_CPF_CLIENTE UNIQUE (CPF)
);