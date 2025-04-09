USE loja;

-- QUESTOES

-- 1. Contar o número total de clientes
SELECT COUNT(*) as NumTotalClientes -- (*) para contar o total
FROM clientes c;




-- 2. Contar o número total de pedidos
SELECT COUNT(*) as NumTotalPedidos
FROM pedidos pe;






-- 3. Calcular o valor total de todos os pedidos
SELECT
pe.id,
    SUM(pe.quantidade * pr.preco) as ValorTotalPedidos
   
FROM pedidos AS pe

JOIN produtos AS pr
ON pe.produto_id = pr.id
   
GROUP BY pe.id; -- não estou entendendo direito o group by







-- 4. Calcular a média de preço dos produtos
SELECT AVG(preco) as MediaDePreco -- A função AVG no SQL calcula a média aritmética dos valores de uma coluna numérica.
FROM  produtos;






-- 5. Listar todos os clientes e seus pedidos     -FACIL
SELECT
c.nome as Nome,
    pr.nome as Produto,
    pe.id as Id_do_Pedido
   
FROM pedidos as pe

JOIN clientes as c ON pe.cliente_id = c.id
LEFT JOIN produtos as pr ON pe.produto_id = pr.id;




-- 6. Listar todos os pedidos e seus produtos, incluindo pedidos sem produtos  - FACIL
SELECT  
pe.id as PEDIDO,
pr.nome as PRODUTO
FROM pedidos as pe

LEFT JOIN produtos as pr ON pe.produto_id = pr.id; -- "LEFT JOIN" para incluir os produtos "NULL", vazios.



-- 7. Listar os produtos mais caros primeiro    -FACIL
SELECT pr.nome, pr.preco
FROM produtos as pr
ORDER BY pr.preco DESC;  -- para ordenar pela de preco em que seria desc por comecar do maior ate o menor.





-- 8. Listar os produtos com menor estoque    -FACIL
SELECT pr.nome, pr.estoque
FROM produtos as pr
ORDER BY pr.estoque ASC
LIMIT 3;  -- para limitar quantas linhas irão aparecer na tabela. Listei os 3 produtos com menor estoque



-- 9. Contar quantos pedidos foram feitos por cliente
SELECT c.nome, COUNT(pe.quantidade) as Numero_de_Pedidos
FROM clientes as c
LEFT JOIN pedidos as pe ON pe.cliente_id = c.id -- pq tem clientes que podem ter feito 0 pedidos
GROUP BY c.nome;



-- 10. Contar quantos produtos diferentes foram vendidos
SELECT COUNT(DISTINCT produto_id) as ProdutosDiferentes
FROM pedidos -- Tem que ser do pedidos, pq so da pra saber quais produtos foram vendidos pela aba de PEDIDOS
WHERE produto_id IS NOT NULL; -- Exclui os que nn foram vendidos




-- 11. Mostrar os clientes que não realizaram pedidos
SELECT c.nome, pe.id
FROM clientes as c
LEFT JOIN pedidos as pe ON pe.cliente_id = c.id
WHERE pe.id IS NULL;




-- 12. Mostrar os produtos que nunca foram vendidos
SELECT pr.nome
FROM produtos as pr
LEFT JOIN pedidos as pe ON pe.produto_id = pr.id
WHERE pe.id IS NULL;


-- 13. Contar o número de pedidos feitos por dia
SELECT pe.data_pedido, COUNT(id) AS numeroDEpedidosPorDia
FROM pedidos AS pe
GROUP BY data_pedido
ORDER BY data_pedido;




-- 14. Listar os produtos mais vendidos




-- 15. Encontrar o cliente que mais fez pedidos


-- 16. Listar os pedidos e os clientes que os fizeram, incluindo pedidos sem clientes


-- 17. Listar os produtos e o total de vendas por produto


-- 18. Calcular a média de quantidade de produtos por pedido



-- 19. Listar os pedidos ordenados por data (mais recentes primeiro)  FACIL
-- ou seja, ASC


-- 20. Contar quantos clientes possuem telefone cadastrado


-- 21. Encontrar o cliente que gastou mais dinheiro em pedidos.

-- 22. Listar os 5 produtos mais vendidos.



-- 23. Listar os clientes que já fizeram pedidos e o número de pedidos de cada um.


-- 24. Encontrar a data com mais pedidos realizados


-- 25. Calcular a média de valor gasto por pedido

