/* =====================================================
   RELATÓRIO 5 - BELLA NAPOLI
   ===================================================== */

/* 1. Inserção de 5 pizzas */
INSERT INTO pizza (nome, descricao, categoria, preco)
VALUES
('Frango com Catupiry', 'Frango desfiado com catupiry', 'Tradicional', 45.00),
('Calabresa', 'Calabresa e cebola', 'Tradicional', 35.00),
('Portuguesa', 'Presunto, ovos e cebola', 'Especial', 60.00),
('Chocolate', 'Chocolate ao leite', 'Doces', 55.00),
('Camarão Especial', 'Camarão com queijo', 'Especial', 85.00);


/* 2. Busca por padrão (LIKE) */
SELECT *
FROM pizza
WHERE nome LIKE '%Frango%';


/* 3. Filtro de faixa (BETWEEN) */
SELECT *
FROM pizza
WHERE preco BETWEEN 40.00 AND 60.00;


/* 4. Seleção por lista (IN) */
SELECT *
FROM cliente
WHERE endereco IN ('Centro', 'Sudoeste', 'Jardins');


/* =====================================================
   AMPLIAÇÃO DO DESAFIO
   ===================================================== */

/* 1. Pedidos com data_entrega nula */
SELECT *
FROM pedido
WHERE data_entrega IS NULL;


/* 2. Clientes que possuem pedidos (EXISTS) */
SELECT nome
FROM cliente c
WHERE EXISTS (
    SELECT 1
    FROM pedido p
    WHERE p.id_cliente = c.id_cliente
);


/* 3. Reajuste de 10% para categorias Doces e Especiais */
UPDATE pizza
SET preco = preco * 1.10
WHERE categoria IN ('Doces', 'Especiais');


/* 4. Remover clientes de teste */
DELETE FROM cliente
WHERE nome LIKE 'TESTE%';
