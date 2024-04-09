SELECT
    payment_method_raw,
    SUM(price * quantity) AS valor_total
FROM pedidos
    INNER JOIN pedidositens ON pedidos.order_id = pedidositens.order_id
GROUP BY payment_method_raw
ORDER BY valor_total DESC