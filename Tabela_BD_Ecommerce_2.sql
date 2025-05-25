CREATE DATABASE Ecommerce_Caixa_de_Pandora   ----- Criando Banco de Dados

-----------------Criando as tabelas --------------------------------
use Loja_Caixa_de_Pandora ---- Banco de Dados criado

*/********************** Tbl_endereco***************************/
select * from endereco
CREATE TABLE endereco (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  cliente_id BIGINT NOT NULL,
  rua VARCHAR(255) NOT NULL,
  numero VARCHAR(255) NOT NULL,
  bairro VARCHAR(255) NOT NULL,
  cidade VARCHAR(255) NOT NULL,
  estado VARCHAR(255) NOT NULL,
  cep VARCHAR(255) NOT NULL,
  pais VARCHAR(255) NOT NULL
);
----------------- Inserindo dados na tabela 
INSERT INTO endereco (cliente_id, rua, numero, bairro, cidade, estado, cep, pais) VALUES
(1, 'Rua das Flores', '123', 'Jardim Primavera', 'São Paulo', 'SP', '12345-678', 'Brasil'),
(2, 'Avenida Paulista', '456', 'Bela Vista', 'São Paulo', 'SP', '98765-432', 'Brasil'),
(3, 'Rua dos Pinheiros', '789', 'Pinheiros', 'São Paulo', 'SP', '11223-445', 'Brasil'),
(4, 'Rua Oratorio', '215', 'Mooca', 'São Paulo', 'SP', '11223-445', 'Brasil'),
(5, 'Rua do Ipe', '89', 'Jardins', 'São Paulo', 'SP', '10226-445', 'Brasil');




*/********************** Tbl_cliente***************************/
select * from cliente
use Loja_Caixa_de_Pandora 
create table cliente (
id BIGINT PRIMARY KEY IDENTITY(1,1),
  nome_completo text not null,
  email text not null,
  senha text not null,
  endereco_id bigint,
  foreign key (endereco_id) references endereco (id)
);

----------------- Inserindo dados na tabela 
INSERT INTO cliente (nome_completo, email, senha, endereco_id) VALUES
('João Silva', 'joao.silva@example.com', 'senha123', 1),
('Maria Oliveira', 'maria.oliveira@example.com', 'senha456', 2),
('Carlos Souza', 'carlos.souza@example.com', 'senha789', 3),
('Ana Pereira', 'ana.pereira@example.com', 'senha321', 4),
('Pedro Lima', 'pedro.lima@example.com', 'senha654', 5);




*/********************** Tbl_pedido***************************/
select * from pedido
use Loja_Caixa_de_Pandora 
CREATE TABLE pedido (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  cliente_id BIGINT NOT NULL,
  data_pedido DATETIMEOFFSET DEFAULT SYSDATETIMEOFFSET(),
  status_pedido TEXT NOT NULL,
  total NUMERIC(10, 2) NOT NULL,
  metodo_pagamento TEXT NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES cliente (id)
);
----------------- Inserindo dados na tabela
INSERT INTO pedido (cliente_id, data_pedido, status_pedido, total, metodo_pagamento) VALUES
(1, SYSDATETIMEOFFSET(), 'Pendente', 150.75, 'Cartão de Crédito'),
(2, SYSDATETIMEOFFSET(), 'Concluído', 200.50, 'Boleto Bancário'),
(3, SYSDATETIMEOFFSET(), 'Cancelado', 99.99, 'Pix'),
(1, SYSDATETIMEOFFSET(), 'Pendente', 250.00, 'Cartão de Débito'),
(2, SYSDATETIMEOFFSET(), 'Concluído', 300.00, 'Transferência Bancária'),
(3, SYSDATETIMEOFFSET(), 'Pendente', 120.00, 'Dinheiro');





*/********************** Tbl_produto***************************/
select * from produto
use Loja_Caixa_de_Pandora 
create table produto (
  id bigint primary key IDENTITY (1,1),
  nome_produto text not null,
  descricao text,
  preco numeric(10, 2) not null,
  quantidade_estoque int not null,
  categoria_id bigint,
  marca_id bigint
);
----------------- Inserindo dados na tabela 
INSERT INTO produto (nome_produto, descricao, preco, quantidade_estoque, categoria_id, marca_id) VALUES
('Notebook', 'Notebook de última geração', 3500.00, 10, 1, 1),
('Smartphone', 'Smartphone com câmera de alta resolução', 2000.00, 20, 2, 2),
('Tablet', 'Tablet com tela de 10 polegadas', 1500.00, 15, 1, 3),
('Smartwatch', 'Smartwatch com monitoramento de saúde', 800.00, 30, 2, 1),
('Fone de Ouvido', 'Fone de ouvido com cancelamento de ruído', 300.00, 50, 3, 2),
('Notebook', 'Notebook de última geração', 3500.00, 5, 1, 1),
('Tablet', 'Tablet com tela de 10 polegadas', 1500.00, 10, 1, 3);

INSERT INTO produto (nome_produto, descricao, preco, quantidade_estoque, categoria_id, marca_id) VALUES
('Notebook', 'Notebook de última geração', 3500.00, 10, 1, 1),
('Smartphone', 'Smartphone com câmera de alta resolução', 2000.00, 20, 2, 2),
('Tablet', 'Tablet com tela de 10 polegadas', 1500.00, 15, 1, 3),
('Smartwatch', 'Smartwatch com monitoramento de saúde', 800.00, 30, 2, 1),
('Fone de Ouvido', 'Fone de ouvido com cancelamento de ruído', 300.00, 50, 3, 2);

INSERT INTO produto (nome_produto, descricao, preco, quantidade_estoque, categoria_id, marca_id) VALUES
('Notebook', 'Notebook de última geração', 3500.00, 10, 1, 1),
('Smartphone', 'Smartphone com câmera de alta resolução', 2000.00, 20, 2, 2),
('Tablet', 'Tablet com tela de 10 polegadas', 1500.00, 15, 1, 3),
('Smartwatch', 'Smartwatch com monitoramento de saúde', 800.00, 30, 2, 1),
('Fone de Ouvido', 'Fone de ouvido com cancelamento de ruído', 300.00, 50, 3, 2);








*/********************** Tbl_item_pedido***************************/

select * from item_pedido
use Loja_Caixa_de_Pandora 
create table item_pedido (
  id bigint primary key IDENTITY (1,1),
  pedido_id bigint not null,
  produto_id bigint not null,
  quantidade int not null,
  preco_unitario numeric(10, 2) not null,
  foreign key (pedido_id) references pedido (id),
  foreign key (produto_id) references produto (id)
);
----------------- Inserindo dados na tabela 






*/********************** Tbl_categria***************************/
select * from categoria
use Loja_Caixa_de_Pandora 
create table categoria (
  id bigint primary key IDENTITY (1,1),
  nome_categoria text not null,
  descricao text
);
----------------- Inserindo dados na tabela 
INSERT INTO categoria (nome_categoria, descricao) VALUES
('Eletrônicos', 'Produtos eletrônicos em geral'),
('Celulares', 'Smartphones e acessórios'),
('Informática', 'Computadores e periféricos'),
('Roupas', 'Vestuário e acessórios'),
('Sapatos', 'Calçados diversos');




*/********************** Tbl_marca***************************/
select * from marca
use Loja_Caixa_de_Pandora 
create table marca (
  id bigint primary key IDENTITY (1,1),
  nome_marca text not null
);
----------------- Inserindo dados na tabela 
INSERT INTO marca (nome_marca) VALUES
('Marca A'),
('Marca B'),
('Marca C'),
('Marca D'),
('Marca E'),
('Marca F');






*/********************** Tbl_carrinho***************************/
use Loja_Caixa_de_Pandora 
create table carrinho (
  id bigint primary key IDENTITY (1,1),
  cliente_id bigint not null,
  foreign key (cliente_id) references cliente (id)
);
----------------- Inserindo dados na tabela 
INSERT INTO carrinho (cliente_id) VALUES
(1),
(2),
(3),
(4),  -- Novo cliente
(5);  -- Novo cliente
















*/********************** Tbl_item_carrinho***************************/
use Loja_Caixa_de_Pandora
create table item_carrinho (
  id bigint primary key IDENTITY (1,1),
  carrinho_id bigint not null,
  produto_id bigint not null,
  quantidade int not null,
  foreign key (carrinho_id) references carrinho (id),
  foreign key (produto_id) references produto (id)
);
----------------- Inserindo dados na tabela 
INSERT INTO item_carrinho (carrinho_id, produto_id, quantidade) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(1, 4, 2),  -- Adicionando Smartwatch ao carrinho 1
(2, 5, 1),  -- Adicionando Fone de Ouvido ao carrinho 2
(3, 1, 1),  -- Adicionando Notebook ao carrinho 3 (repetido)
(1, 3, 1),  -- Adicionando Tablet ao carrinho 1
(2, 4, 1),  -- Adicionando Smartwatch ao carrinho 2
(3, 5, 2);  -- Adicionando Fone de Ouvido ao carrinho 3

















*/********************** Tbl_cliente***************************/
USE Loja_Caixa_de_Pandora;

ALTER TABLE produto
ADD FOREIGN KEY (categoria_id) REFERENCES categoria (id);

ALTER TABLE produto
ADD FOREIGN KEY (marca_id) REFERENCES marca (id);

----------------- Inserindo dados na tabela 






