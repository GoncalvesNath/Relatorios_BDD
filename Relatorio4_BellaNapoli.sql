/* =====================================================
   RELATÓRIO 4 - BELLA NAPOLI
   ===================================================== */


/* =====================================================
   DESAFIO INICIAL
   ===================================================== */

/* 1. Popular o cardápio com 3 pizzas */
INSERT INTO pizza (nome, descricao, preco)
VALUES
('Margheritta', 'Molho de tomate, mussarela e manjericao', 45.00),
('Calabresa',   'Molho de tomate, calabresa e cebola',     55.00),
('Portuguesa',  'Presunto, ovos, cebola e mussarela',      65.00);

/* 2. Pizzas com preço maior que R$ 50,00 (operador >) */
SELECT *
FROM pizza
WHERE preco > 50;


/* =====================================================
   AMPLIAÇÃO DO DESAFIO
   ===================================================== */

/* 1. Cadastro de 2 clientes */
INSERT INTO cliente (nome, telefone, endereco)
VALUES
('Juliane', '11958536417', 'Bairro Centro'),
('Lucca',   '11958536418', 'Bairro Sul');

/* 2a. Cliente do Bairro Centro cujo ID é igual a 1 (AND) */
SELECT *
FROM cliente
WHERE endereco = 'Bairro Centro'
AND   id_cliente = 1;

/* 2b. Clientes do Bairro Sul ou Bairro Norte (OR) */
SELECT *
FROM cliente
WHERE endereco = 'Bairro Sul'
OR    endereco = 'Bairro Norte';

/* 3. Registro de venda - vincular pedido */
INSERT INTO pedido (id_cliente, status)
VALUES (2, 'EM PREPARO');

INSERT INTO item_pedido (id_pedido, id_pizza, quantidade, preco_unit)
VALUES (2, 2, 1, 55.00);

/* 4. Pedidos que não estão finalizados (operador <>) */
SELECT *
FROM pedido
WHERE status <> 'FINALIZADO';
