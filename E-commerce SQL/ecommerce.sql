CREATE TABLE Clientes (
    idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Pnome VARCHAR(10) NOT NULL,
    NomeMeio VARCHAR(3),
    Sobrenome VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Endereco VARCHAR(255),
    CONSTRAINT UNIQUE_CPF_CLIENTE UNIQUE (CPF)
);

CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    NomeProduto VARCHAR(255) NOT NULL,
    Classificacao_kids BOOL DEFAULT FALSE,
    Categoria ENUM('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') NOT NULL,
    Avaliacao FLOAT DEFAULT 0,
    tamanho VARCHAR(10)
);

CREATE TABLE Pagamento (
    idCliente INT,
    idPagamento INT,
    tipoPagamento ENUM('Boleto', 'Cartão', 'Pix'),
    limiteDisponivel FLOAT,
    PRIMARY KEY(idCliente, idPagamento),
    CONSTRAINT FK_cliente FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

CREATE TABLE Pedido (
    idPedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idPedidoCliente INT,
    StatusPedido ENUM('Em andamento', 'Em processamento', 'Enviado', 'Entregue') DEFAULT 'Em processamento',
    Descricao VARCHAR(45),
    Frete FLOAT DEFAULT 10,
    PagamentoDinheiro BOOLEAN DEFAULT FALSE,
    CONSTRAINT FK_pedido_cliente FOREIGN KEY (idPedidoCliente) REFERENCES Clientes(idCliente)
);

CREATE TABLE Estoque (
    idEstoque INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    LocalEstoque VARCHAR(255),
    Quantidade INT DEFAULT 0
);

CREATE TABLE Fornecedor (
    idFornecedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    Contato CHAR(11) NOT NULL,
    CONSTRAINT unique_Fornecedor UNIQUE (CNPJ)
);

CREATE TABLE Vendedor (
    idVendedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    CPF CHAR(9),
    EnderecoVendedor VARCHAR(255),
    Contato CHAR(11) NOT NULL,
    CONSTRAINT unique_CNPJ_Vendedor UNIQUE (CNPJ),
    CONSTRAINT unique_CPF_Vendedor UNIQUE (CPF)
);

-- Tabela de ralacionamentos M:N

CREATE TABLE ProdutoVendedor (
    idPVendedor INT,
    idPproduto INT,
    ProdutoQntd INT DEFAULT 1,
    PRIMARY KEY (idPVendedor, idPproduto),
    CONSTRAINT FK_produto_vendedor FOREIGN KEY (idPVendedor) REFERENCES Vendedor(idVendedor),
    CONSTRAINT FK_produto_produto FOREIGN KEY (idPproduto) REFERENCES Produto(idProduto)
);

CREATE TABLE ProdutoPedido (
    idPpedido INT,
    idPproduto INT,
    PpQntd INT DEFAULT 1,
    PpStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPpedido, idPproduto),
    CONSTRAINT FK_produto_pedido FOREIGN KEY (idPpedido) REFERENCES Pedido(idPedido),
    CONSTRAINT FK_produto_pProduto FOREIGN KEY (idPproduto) REFERENCES Produto(idProduto)
);

CREATE TABLE EstoqueProduto (
    idLProduto INT,
    idLEstoque INT,
    Endereco VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLProduto, idLEstoque),
    CONSTRAINT FK_estoque_localizacao_produto FOREIGN KEY (idLProduto) REFERENCES Pedido(idPedido),
    CONSTRAINT FK_estoque_localizacao_estoque FOREIGN KEY (idLEstoque) REFERENCES Estoque(idEstoque)
);

CREATE TABLE ProdutoFornecedor (
    idPFornecedor INT,
    idPProduto INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (idPFornecedor, idPProduto),
    CONSTRAINT FK_produto_fornecedor_fornecedor FOREIGN KEY (idPFornecedor) REFERENCES Fornecedor(idFornecedor),
    CONSTRAINT FK_produto_fornecedor_produto FOREIGN KEY (idPProduto) REFERENCES Produto(idProduto)
);