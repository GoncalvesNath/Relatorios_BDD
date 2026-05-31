/* =====================================================
   RELATÓRIO 3 - BELLA NAPOLI
   ===================================================== */


/* =====================================================
   DESAFIO INICIAL
   ===================================================== */
CREATE TABLE cliente (
	id_cliente INT PRIMARY KEY IDENTITY,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(20), 
	endereco VARCHAR (150),
	data_cadastro DATE DEFAULT cast (getdate() as date)
	);

CREATE TABLE pizza (
	id_pizza INT PRIMARY  KEY IDENTITY,
	nome VARCHAR(100) NOT NULL,
	descricao VARCHAR(200),
	preco DECIMAL(10, 2) NOT NULL
	);

CREATE TABLE pedido (
	id_pedido INT PRIMARY KEY IDENTITY,
	id_cliente INT NOT NULL,
	data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
	status VARCHAR(30) DEFAULT 'PENDENTE',
	CONSTRAINT fk_pedido_cliente
		FOREIGN KEY (id_cliente)
		REFERENCES cliente(id_cliente)
	);
CREATE TABLE item_pedido (
	id_item INT PRIMARY KEY IDENTITY,
	id_pedido INT NOT NULL,
	id_pizza INT NOT NULL,
	quantidade INT NOT NULL,
	preco_unit DECIMAL (10, 2) NOT NULL,
	CONSTRAINT fk_item_pedido
		FOREIGN KEY (id_pedido)
		REFERENCES pedido(id_pedido),
	CONSTRAINT fk_item_pizza
		FOREIGN KEY (id_pizza)
		REFERENCES pizza(id_pizza)
);

/* Inserção de 3 pizzas */
INSERT INTO pizza (nome, descricao, preco)
VALUES
('Margheritta', 'Molho de tomate, mussarela e manjericao', 45.00),
('Calabresa',   'Molho de tomate, calabresa e cebola',     55.00),
('Portuguesa',  'Presunto, ovos, cebola e mussarela',      65.00);

/* Cadastro de 2 clientes */
INSERT INTO cliente (nome, telefone, endereco)
VALUES
('Juliane', '11958536417', 'Bairro Centro'),
('Lucca',   '11958536418', 'Bairro Sul');

/* Criação de pedido vinculando cliente a uma pizza */
INSERT INTO pedido (id_cliente, status)
VALUES (1, 'PENDENTE');

INSERT INTO item_pedido (id_pedido, id_pizza, quantidade, preco_unit)
VALUES (1, 1, 1, 45.00);


/* =====================================================
   AMPLIAÇÃO DO DESAFIO
   ===================================================== */

/* 1. Reajuste de 10% em todas as pizzas */
UPDATE pizza
SET preco = preco * 1.10;

/* 2. Atualização de endereço do cliente fidelizado */
UPDATE cliente
SET endereco = 'Avenida Central, 500'
WHERE id_cliente = 1;

/* 3. Remover pedidos cancelados */
DELETE FROM pedido
WHERE status = 'CANCELADO';

/* 4. Promoção relâmpago */
UPDATE pizza
SET nome  = 'Super Promocao',
    preco = preco * 0.90
WHERE nome = 'Pizza da Casa';
