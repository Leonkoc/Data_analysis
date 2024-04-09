SELECT 
    *,
    CASE 
    --condicoes
    --QUANDO ORDESTATUS FOR -100 ENTÃO CHAME A DE ONLINE, SENÃO FISICA
        WHEN order_status = -100 THEN 'Online'
    --when order_status <> - 100 THEN 'Loja fisica'
        ELSE 'Loja física'
    END AS canal_venda
FROM pedidos
LIMIT 5000