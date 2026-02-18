-- Algumas queries

-- Listar todos os clientes cadastrados

SELECT *
FROM cliente;

-- Listar nome e preço de todos os produtos

SELECT nome, preco 
FROM produto;

-- Mostrar apenas produtos da categoria 'Eletrônicos'

SELECT p.nome, p.preco
FROM produto p
JOIN categoria c ON p.id_categoria = c.id_categoria
WHERE c.nome = 'Eletrônicos';

-- Listar todos os pedidos confirmados

SELECT * 
FROM pedido
WHERE status = 'Confirmado';

-- Mostrar os produtos comprados no pedido 1

SELECT p.nome, ip.quantidade, ip.preco_unitario
FROM item_pedido ip
JOIN produto p ON ip.id_produto = p.id_produto
WHERE ip.id_pedido = 1;

-- Calcular o valor total de cada pedido (sem frete)

SELECT ip.id_pedido,
SUM(ip.quantidade * ip.preco_unitario) AS total_pedido
FROM item_pedido ip
GROUP BY ip.id_pedido;

-- Calcular valor total do pedido incluindo frete

SELECT p.id_pedido,
SUM(ip.quantidade * ip.preco_unitario) + p.valor_frete AS total_com_frete
FROM pedido p
JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
GROUP BY p.id_pedido;

-- Listar clientes que já fizeram pedidos

SELECT DISTINCT c.primeiro_nome, c.sobrenome
FROM cliente c
JOIN pedido p ON c.id_cliente = p.id_cliente;

-- Mostrar o produto mais vendido
SELECT p.nome,
SUM(ip.quantidade) AS total_vendido
FROM item_pedido ip
JOIN produto p ON ip.id_produto = p.id_produto
GROUP BY p.id_produto
ORDER BY total_vendido DESC
LIMIT 1;

-- Mostrar o total vendido por produto (em dinheiro)
SELECT p.nome,
SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM item_pedido ip
JOIN produto p ON ip.id_produto = p.id_produto
GROUP BY p.id_produto
ORDER BY faturamento DESC;

-- Mostrar o cliente que mais gastou
SELECT c.primeiro_nome, c.sobrenome,
SUM(ip.quantidade * ip.preco_unitario + p.valor_frete) AS total_gasto
FROM cliente c
JOIN pedido p ON c.id_cliente = p.id_cliente
JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
GROUP BY c.id_cliente
ORDER BY total_gasto DESC
LIMIT 1;

-- Mostrar estoque total por produto

SELECT p.nome,
SUM(e.quantidade) AS estoque_total
FROM estoque e
JOIN produto p ON e.id_produto = p.id_produto
GROUP BY p.id_produto;

-- Mostrar produtos com estoque abaixo de 50 unidades

SELECT p.nome,
SUM(e.quantidade) AS estoque_total
FROM estoque e
JOIN produto p ON e.id_produto = p.id_produto
GROUP BY p.id_produto
HAVING estoque_total < 50;

-- Mostrar fornecedores que fornecem mais de 200 unidades

SELECT f.razao_social,
SUM(pf.quantidade) AS total_fornecido
FROM produto_fornecedor pf
JOIN fornecedor f ON pf.id_fornecedor = f.id_fornecedor
GROUP BY f.id_fornecedor
HAVING total_fornecido > 200;

-- Mostrar pedidos que possuem mais de um produto diferente
SELECT id_pedido,
COUNT(id_produto) AS quantidade_produtos
FROM item_pedido
GROUP BY id_pedido
HAVING COUNT(id_produto) > 1;
