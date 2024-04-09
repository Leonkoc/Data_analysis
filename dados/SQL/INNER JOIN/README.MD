Esta é uma consulta em SQL que seleciona a forma de pagamento e o valor total de vendas por cada forma de pagamento a partir das tabelas "pedidos" e "pedidositens".

A cláusula "INNER JOIN" é usada para unir as duas tabelas a partir da coluna "order_id". Em seguida, é aplicada a função "SUM" para multiplicar o preço pelo número de unidades vendidas em cada pedido e obter o valor total de vendas por cada forma de pagamento.

A cláusula "GROUP BY" é utilizada para agrupar os resultados pela forma de pagamento, enquanto a cláusula "ORDER BY" é utilizada para ordenar os resultados em ordem decrescente de valor total de vendas.

Em resumo, esta consulta retorna uma tabela que mostra o valor total de vendas por forma de pagamento, ordenados em ordem decrescente de valor total.