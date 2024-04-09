SELECT
    payment_method_raw,
    SUM(price * quantity) AS valor_total,
CASE
    WHEN LOWER(payment_method_raw) LIKE 'Cartão%' THEN 'Cartão'
    WHEN LOWER(payment_method_raw) LIKE '%card%' THEN 'Cartão'
    WHEN LOWER(payment_method_raw) LIKE 'boleto' THEN 'Boleto'
    WHEN LOWER(payment_method_raw) LIKE '%parcelado%' THEN 'Cartão'
    WHEN LOWER(payment_method_raw) LIKE '%vista' THEN 'Cartão'
    WHEN LOWER(payment_method_raw) LIKE 'visa%' THEN 'Cartão'
    WHEN LOWER(payment_method_raw) LIKE 'ted' THEN 'Ted'
    WHEN LOWER(payment_method_raw) LIKE 'paypal' THEN 'Paypal'
    WHEN LOWER(payment_method_raw) IN ('cartao', 'cartão','bradesco' , 'cartão de crédito', 'visa', 'mastercard', 'cartao de credito', 'elo', 'cielo credito') THEN 'Cartão'
    ELSE 'Outro'
END AS forma_pagamento
FROM pedidos
    INNER JOIN pedidositens ON pedidos.order_id = pedidositens.order_id

GROUP BY payment_method_raw, forma_pagamento
ORDER BY valor_total DESC