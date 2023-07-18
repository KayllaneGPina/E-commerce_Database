use ecommerce;
show tables;

INSERT INTO Clientes (Pnome, NomeMeio, Sobrenome, CPF, Endereco) 
	values('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
        ('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'),
		('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
		('Julia','S','França', 789123456,'rua lareijras 861, Centro - Cidade das flores'),
		('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
		('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores');

SELECT * FROM clientes;  

INSERT INTO Produto (NomeProduto, Classificacao_kids, Categoria, Avaliacao, tamanho) 
    values('Fone de ouvido',false,'Eletrônico','4', null),
        ('Barbie Elsa',true,'Brinquedos','3', null),
        ('Body Carters',true,'Vestimenta','5', null),
        ('Microfone Vedo - Youtuber',False,'Eletrônico','4', null),
        ('Sofá retrátil',False,'Móveis','3','3x57x80'),
        ('Farinha de arroz',False,'Alimentos','2',null),
        ('Fire Stick Amazon',False,'Eletrônico','3',null);

SELECT product.NomeProduto, categoria, avaliacao
FROM produto product WHERE `Avaliacao` >= 2;

SELECT nomeProduto as 'Produtos'
FROM produto
ORDER BY nomeProduto ASC;

INSERT INTO Estoque (LocalEstoque, Quantidade) 
    values ('Rio de Janeiro',1000),
        ('Rio de Janeiro',500),
        ('São Paulo',10),
        ('São Paulo',100),
        ('São Paulo',10),
        ('Brasília',60);

SELECT LocalEstoque as 'Regiões', SUM(Quantidade) as 'Quantidade em Estoque'
FROM Estoque
GROUP BY `Regiões`
HAVING SUM(Quantidade) > 50;

SELECT * FROM Clientes AS C JOIN Produto AS P ON C.idCliente = P.idProduto; 