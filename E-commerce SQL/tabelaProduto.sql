CREATE TABLE product (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(10) NOT NULL,
    classification_Kids BOOL DEFAULT FALSE,
    category ENUM('Eletrônico', 'Roupas', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
    avaliacao FLOAT DEFAULT 0,
    size VARCHAR(10) -- Size é a dimensão do produto
);