/* =====================================================
   RELATÓRIO 6 - BELLA NAPOLI
   ===================================================== */


/* =====================================================
   DESAFIO INICIAL
   ===================================================== */

/* 1. View de preços - pizzas abaixo de R$ 50,00 */
CREATE VIEW vw_cardapio_economico AS (
SELECT nome, preco
FROM pizza
WHERE preco < 50.00);


/* 2. Consulta na view para verificar o filtro */
SELECT *
FROM vw_cardapio_economico;


/* 3. View de clientes ocultando endereço */
CREATE VIEW vw_clientes_contato AS (
SELECT nome, telefone
FROM cliente);


/* =====================================================
   AMPLIAÇÃO DO DESAFIO
   ===================================================== */

/* 1. View de pedidos ativos (excluindo Finalizado e Cancelado) */
CREATE VIEW vw_pedidos_pendentes AS (
SELECT
    c.nome       AS cliente,
    p.nome       AS pizza,
    ped.status
FROM pedido ped
JOIN cliente c  ON ped.id_cliente = c.id_cliente
JOIN item_pedido ip ON ped.id_pedido = ip.id_pedido
JOIN pizza p    ON ip.id_pizza = p.id_pizza
WHERE ped.status <> 'FINALIZADO'
AND   ped.status <> 'CANCELADO');


/* 2. View de faturamento com taxa de entrega (+10%) */
CREATE VIEW vw_faturamento AS (
SELECT
    nome                    AS pizza,
    preco                   AS preco_original,
    preco * 1.10            AS preco_com_taxa_entrega
FROM pizza);


/* 3. Manutenção: adicionar coluna de data na view vw_pedidos_pendentes */
CREATE OR REPLACE VIEW vw_pedidos_pendentes AS (
SELECT
    c.nome          AS cliente,
    p.nome          AS pizza,
    ped.status,
    ped.data_pedido AS data
FROM pedido ped
JOIN cliente c  ON ped.id_cliente = c.id_cliente
JOIN item_pedido ip ON ped.id_pedido = ip.id_pedido
JOIN pizza p    ON ip.id_pizza = p.id_pizza
WHERE ped.status <> 'FINALIZADO'
AND   ped.status <> 'CANCELADO');
