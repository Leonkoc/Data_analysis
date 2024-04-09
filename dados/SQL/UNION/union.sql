SELECT *,"Online" AS canal_venda
FROM pedidos
WHERE order_store = -100
UNION ALL
SELECT *, 'Loja Física' as canal_venda
FROM pedidos
WHERE order_store <> -100 -- <> diferente de


