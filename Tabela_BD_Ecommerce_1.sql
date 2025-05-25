----Criando Banco de dados
CREATE DATABASE Ecommerce_Caixa_de_Pandora

------------------------------------------------------------------------------------------------------
---TABELA ENDERE�O

SELECT * FROM endereco;

USE Ecommerce_Caixa_de_Pandora;

CREATE TABLE endereco (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  cliente_id BIGINT NOT NULL,
  rua VARCHAR(255) NOT NULL,
  numero VARCHAR(255) NOT NULL,
  bairro VARCHAR(255) NOT NULL,
  cidade VARCHAR(255) NOT NULL,
  estado VARCHAR(255) NOT NULL,
  cep VARCHAR(255) NOT NULL,
  pais VARCHAR(255) NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

-- Inserindo dados na tabela
INSERT INTO endereco (cliente_id, rua, numero, bairro, cidade, estado, cep, pais) VALUES
(1, 'Rua das Flores', '123', 'Jardim Primavera', 'S�o Paulo', 'SP', '12345-678', 'Brasil'),
(2, 'Avenida Paulista', '456', 'Bela Vista', 'S�o Paulo', 'SP', '98765-432', 'Brasil'),
(3, 'Rua dos Pinheiros', '789', 'Pinheiros', 'S�o Paulo', 'SP', '11223-445', 'Brasil'),
(4, 'Rua Orat�rio', '215', 'Mooca', 'S�o Paulo', 'SP', '11223-445', 'Brasil'),
(5, 'Rua do Ip�', '89', 'Jardins', 'S�o Paulo', 'SP', '10226-445', 'Brasil');


---------------------------------------------------------------------------------------------------
---TABELA CLIENTE
SELECT * FROM cliente;
USE Ecommerce_Caixa_de_Pandora;

CREATE TABLE cliente (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  nome_completo VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  senha VARCHAR(255) NOT NULL
);

-- Inserindo dados na tabela cliente
INSERT INTO cliente (nome_completo, email, senha) VALUES
('Jo�o Silva', 'joao.silva@example.com', 'senha123'),
('Maria Oliveira', 'maria.oliveira@example.com', 'senha456'),
('Carlos Souza', 'carlos.souza@example.com', 'senha789'),
('Ana Pereira', 'ana.pereira@example.com', 'senha321'),
('Pedro Lima', 'pedro.lima@example.com', 'senha654');


-------------------------------------------------------------------------------------------------
--- TABELA PEDIDO
SELECT * FROM pedido;
USE Ecommerce_Caixa_de_Pandora;

CREATE TABLE pedido (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  cliente_id BIGINT NOT NULL,
  data_pedido DATETIMEOFFSET DEFAULT SYSDATETIMEOFFSET(),
  status_pedido VARCHAR(255) NOT NULL,
  total NUMERIC(10, 2) NOT NULL,
  metodo_pagamento VARCHAR(255) NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

-- Inserindo dados na tabela
INSERT INTO pedido (cliente_id, data_pedido, status_pedido, total, metodo_pagamento) VALUES
(1, SYSDATETIMEOFFSET(), 'Pendente', 150.75, 'Cart�o de Cr�dito'),
(2, SYSDATETIMEOFFSET(), 'Conclu�do', 200.50, 'Boleto Banc�rio'),
(3, SYSDATETIMEOFFSET(), 'Cancelado', 99.99, 'Pix'),
(1, SYSDATETIMEOFFSET(), 'Pendente', 250.00, 'Cart�o de D�bito'),
(2, SYSDATETIMEOFFSET(), 'Conclu�do', 300.00, 'Transfer�ncia Banc�ria'),
(3, SYSDATETIMEOFFSET(), 'Pendente', 120.00, 'Dinheiro');


------------------------------------------------------------------------------------------------
---TABELA PRODUTO
SELECT * FROM produto;
USE Ecommerce_Caixa_de_Pandora;

CREATE TABLE produto (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  nome_produto VARCHAR(255) NOT NULL,
  descricao VARCHAR(255),
  preco NUMERIC(10, 2) NOT NULL,
  quantidade_estoque INT NOT NULL,
  categoria_id BIGINT,
  marca_id BIGINT,
  FOREIGN KEY (categoria_id) REFERENCES categoria(id),
  FOREIGN KEY (marca_id) REFERENCES marca(id)
);

-- Inserindo dados na tabela
INSERT INTO produto (nome_produto, descricao, preco, quantidade_estoque, categoria_id, marca_id) VALUES
('Notebook', 'Notebook de �ltima gera��o', 3500.00, 10, 1, 1),
('Smartphone', 'Smartphone com c�mera de alta resolu��o', 2000.00, 20, 2, 2),
('Tablet', 'Tablet com tela de 10 polegadas', 1500.00, 15, 1, 3),
('Smartwatch', 'Smartwatch com monitoramento de sa�de', 800.00, 30, 2, 1),
('Fone de Ouvido', 'Fone de ouvido com cancelamento de ru�do', 300.00, 50, 3, 2);

-----------------------------------------------------------------------------------------------------
---TABELA CATEGORIA
SELECT * FROM categoria;
USE Ecommerce_Caixa_de_Pandora;

CREATE TABLE categoria (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  nome_categoria VARCHAR(255) NOT NULL,
  descricao VARCHAR(255)
);

-- Inserindo dados na tabela
INSERT INTO categoria (nome_categoria, descricao) VALUES
('Eletr�nicos', 'Produtos eletr�nicos em geral'),
('Celulares', 'Smartphones e acess�rios'),
('Inform�tica', 'Computadores e perif�ricos'),
('Roupas', 'Vestu�rio e acess�rios'),
('Sapatos', 'Cal�ados diversos');


----------------------------------------------------------------------------------------------------
---TABELA MARCA
SELECT * FROM marca;
USE Ecommerce_Caixa_de_Pandora;

CREATE TABLE marca (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  nome_marca VARCHAR(255) NOT NULL
);

-- Inserindo dados na tabela
INSERT INTO marca (nome_marca) VALUES
('Marca A'),
('Marca B'),
('Marca C'),
('Marca D'),
('Marca E'),
('Marca F');


----------------------------------------------------------------------------------------------------
---TABELA ITEM PEDIDO
SELECT * FROM item_pedido;
USE Ecommerce_Caixa_de_Pandora;

CREATE TABLE item_pedido (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  pedido_id BIGINT NOT NULL,
  produto_id BIGINT NOT NULL,
  quantidade INT NOT NULL,
  preco_unitario NUMERIC(10, 2) NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES pedido(id),
  FOREIGN KEY (produto_id) REFERENCES produto(id)
);

-- Inserindo dados na tabela
INSERT INTO item_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),  -- Notebook
(2, 2, 2, 2000.00),  -- Smartphone
(3, 3, 1, 1500.00),  -- Tablet
(1, 4, 1, 800.00),   -- Smartwatch
(2, 5, 3, 300.00),   -- Fone de Ouvido
(3, 1, 1, 3500.00),  -- Notebook (repetido)
(1, 3, 2, 1500.00),  -- Tablet (repetido)
(2, 4, 1, 800.00),   -- Smartwatch (repetido)
(3, 5, 2, 300.00);   -- Fone de Ouvido (repetido)

------------------------------------------------------------------------------------
---TABELA CARRINHO
SELECT * FROM carrinho;
USE Ecommerce_Caixa_de_Pandora;

CREATE TABLE carrinho (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  cliente_id BIGINT NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

-- Inserindo dados na tabela
INSERT INTO carrinho (cliente_id) VALUES
(1),
(2),
(3),
(4),
(5); 


-------------------------------------------------------------------------------------
---TABELA ITEM CARRINHO
SELECT * FROM item_carrinho;
USE Ecommerce_Caixa_de_Pandora;

CREATE TABLE item_carrinho (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  carrinho_id BIGINT NOT NULL,
  produto_id BIGINT NOT NULL,
  quantidade INT NOT NULL,
  FOREIGN KEY (carrinho_id) REFERENCES carrinho(id),
  FOREIGN KEY (produto_id) REFERENCES produto(id)
);

-- Inserindo dados na tabela
INSERT INTO item_carrinho (carrinho_id, produto_id, quantidade) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(1, 4, 2),  
(2, 5, 1),  
(3, 1, 1),  
(1, 3, 1),  
(2, 4, 1),  
(3, 5, 2);  

-----------------------------------------------------------------------------
USE Ecommerce_Caixa_de_Pandora;

ALTER TABLE produto
ADD FOREIGN KEY (categoria_id) REFERENCES categoria(id);

ALTER TABLE produto
ADD FOREIGN KEY (marca_id) REFERENCES marca(id);

----------------------------------------------------------------------------
--TABELAS EXISTENTES

SELECT * FROM endereco;
SELECT * FROM cliente;
SELECT * FROM pedido;
SELECT * FROM produto;
SELECT * FROM categoria;
SELECT * FROM marca;
SELECT * FROM item_pedido;
SELECT * FROM carrinho;
SELECT * FROM item_carrinho;





SELECT 
a.nome_cliente,
a.email,
e.status_pedido,
f.nome_produto,
f.preco,
g.nome_categoria
FROM cliente a
left join endereco b on b.id_cliente = a.id_cliente
left join pedido e on e.id_cliente = a.id_cliente
left join carrinho c on c.id_cliente = a.id_cliente
left join item_carrinho d on d.id_carrinho = c.id_carrinho
left join produto f on f.id_produto = d.id_produto
left join categoria g on g.id_categoria = f.id_categoria
left join marca h on h.id_marca = f.id_marca
WHERE a.id_cliente = 3
AND e.status_pedido = 'Cancelado'
