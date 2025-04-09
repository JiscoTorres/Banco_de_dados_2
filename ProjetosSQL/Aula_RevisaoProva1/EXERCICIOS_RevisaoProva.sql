USE loja;

-- QUESTOES

-- 1. Contar o número total de clientes
SELECT COUNT(*) AS total_clientes -- (*) para contar o total
FROM clientes;

-- 2. Contar o número total de pedidos
SELECT COUNT(*) AS total_pedidos
FROM pedidos;

-- 3. Calcular o valor total de todos os pedidos
SELECT pe.id, SUM(pe.quantidade * pr.preco) AS valortotal_pedidos
FROM pedidos AS pe
JOIN produtos AS pr -- Join pq o pedido que tem o codigo do produto, no caso o Id do produto
  ON pe.produto_id = pr.id
GROUP BY pe.id;

-- 4. Calcular a média de preço dos produtos
SELECT AVG(preco) AS mediaPreco_produtos -- A função AVG no SQL calcula a média aritmética dos valores de uma coluna numérica.
FROM produtos;

-- 5. Listar todos os clientes e seus pedidos
SELECT c.nome, pr.nome, pe.id
FROM clientes AS c
LEFT JOIN pedidos AS pe ON pe.cliente_id = c.id
LEFT JOIN produtos pr ON pe.produto_id = pr.id;

-- 6. Listar todos os pedidos e seus produtos, incluindo pedidos sem produtos
SELECT p.id AS pedido_id, p.quantidade, p.data_pedido, pr.nome AS nome_produto, pr.preco
FROM pedidos p
LEFT JOIN produtos pr ON p.produto_id = pr.id -- left para colocar até os nulos
ORDER BY p.id; -- o p.id no SELECT e o ORDER BY p.id é para ordenar em ordem a lista!!

-- 7. Listar os produtos mais caros primeiro
SELECT nome, preco
FROM produtos
ORDER BY preco DESC; -- desc significa Descendente, ou seja, do maior para o menor, se fosse do menor para o maior seria ASC (ascendente)

-- 8. Listar os produtos com menor estoque
SELECT nome, estoque
FROM produtos
ORDER BY estoque ASC;

-- 9. Contar quantos pedidos foram feitos por cliente
SELECT c.id, c.nome, COUNT(pe.id) AS numeroDePedidos
FROM clientes AS c
LEFT JOIN pedidos AS pe ON pe.cliente_id = c.id
GROUP BY c.id, c.nome
ORDER BY numeroDePedidos DESC;

-- 10. Contar quantos produtos diferentes foram vendidos
SELECT COUNT(DISTINCT produto_id) AS ProdutosDiferentes -- DISTINCT para produtos diferentes
FROM pedidos AS pe
WHERE produto_id IS NOT NULL; -- Garante que não contamos o NULL como um produto

-- 11. Mostrar os clientes que não realizaram pedidos
SELECT c.nome, pe.id
FROM clientes AS c
LEFT JOIN pedidos AS pe ON pe.cliente_id = c.id
WHERE pe.id IS NULL;

-- 12. Mostrar os produtos que nunca foram vendidos
SELECT pr.nome
FROM produtos AS pr
LEFT JOIN pedidos AS pe ON pe.produto_id = pr.id
WHERE pe.id IS NULL; -- Se pe.id é NULL, o produto nunca apareceu em pedidos

-- 13. Contar o número de pedidos feitos por dia
SELECT pe.data_pedido, COUNT(id) AS numeroDEpedidosPorDia
FROM pedidos AS pe
GROUP BY data_pedido
ORDER BY data_pedido;

-- 14. Listar os produtos mais vendidos
SELECT pr.nome AS nome_produto, SUM(p.quantidade) AS total_vendido
FROM pedidos p
JOIN produtos pr ON p.produto_id = pr.id
GROUP BY pr.id
ORDER BY total_vendido DESC
LIMIT 3; -- LIMIT os três mais vendidos

-- 15. Encontrar o cliente que mais fez pedidos
SELECT c.nome, count(pe.cliente_id) as total_de_pedidos
FROM clientes as c
JOIN pedidos as pe ON pe.cliente_id = c.id
GROUP BY c.nome, pe.cliente_id
ORDER BY total_de_pedidos DESC
LIMIT 1;


-- 16. Listar os pedidos e os clientes que os fizeram, incluindo pedidos sem clientes
SELECT  pe.id, pe.cliente_id, c.nome
FROM pedidos as pe
LEFT JOIN clientes as c ON pe.cliente_id = c.id
GROUP BY c.nome, pe.id;

-- 17. Listar os produtos e o total de vendas por produto
SELECT
produtos.nome AS produto,
    COUNT(pedidos.produto_id) AS total_de_pedidos,
    SUM(pedidos.quantidade) AS unidades_vendidas
FROM
produtos
LEFT JOIN
pedidos ON pedidos.produto_id = produtos.id
GROUP BY
produtos.nome;


-- 18. Calcular a média de quantidade de produtos por pedido
SELECT
    pe.id AS Pedido,
    pr.nome AS Nome_produto,
    pe.produto_id,
    AVG(pe.quantidade) AS media_quantidade_de_produtos
FROM pedidos AS pe
JOIN produtos AS pr ON pe.produto_id = pr.id
GROUP BY pe.id, pr.nome, pe.produto_id;



SELECT
AVG(pedidos.quantidade) AS quantidade_media_por_pedido
FROM
pedidos;




-- 19. Listar os pedidos ordenados por data (mais recentes primeiro)  FACIL
-- ou seja, ASC
SELECT
pe.id as Pedido,
pe.data_pedido as DataDoPedido
FROM pedidos as pe
ORDER BY data_pedido DESC;



-- 20. Contar quantos clientes possuem telefone cadastrado
SELECT  COUNT(c.id) as Telefones_cadastrados
FROM clientes as c
WHERE c.telefone IS NOT NULL;


-- 21. Encontrar o cliente que gastou mais dinheiro em pedidos.
SELECT
    pe.cliente_id,
    c.nome,
    SUM(pe.quantidade * pr.preco) AS totalGasto
FROM pedidos AS pe
JOIN clientes AS c ON pe.cliente_id = c.id
JOIN produtos AS pr ON pe.produto_id = pr.id
GROUP BY pe.cliente_id, c.nome
ORDER BY totalGasto DESC
LIMIT 1;

-- 22. Listar os 5 produtos mais vendidos.
SELECT
pr.nome as Nome,
SUM(pe.quantidade) as unidadesVendidas
   
FROM produtos AS pr

LEFT JOIN pedidos AS pe ON pe.produto_id = pr.id

GROUP BY pr.nome

ORDER BY unidadesVendidas DESC

LIMIT 5;


-- 23. Listar os clientes que já fizeram pedidos e o número de pedidos de cada um.
SELECT  pe.cliente_id, c.nome, pe.quantidade
FROM pedidos as pe

JOIN clientes as c ON pe.cliente_id = c.id

WHERE pe.quantidade IS NOT NULL;

-- 24. Encontrar a data com mais pedidos realizados
SELECT data_pedido as Data_Pedido, COUNT(pe.quantidade) as Quantidade
FROM pedidos pe

GROUP BY pe.data_pedido
ORDER BY Quantidade DESC
LIMIT 1;


-- 25. Calcular a média de valor gasto por pedido
SELECT SUM(p.quantidade * pr.preco) / COUNT(DISTINCT p.id) AS media_valor_por_pedido
FROM pedidos p
JOIN produtos pr ON p.produto_id = pr.id
WHERE p.produto_id IS NOT NULL;