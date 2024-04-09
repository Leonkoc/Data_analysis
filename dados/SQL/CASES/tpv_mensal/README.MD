# TPV Mensal
Antes de mergulharmos na análise mensal do TPV, é importante compreender o contexto da área de negócios.

## TPV: Significado e Importância no Setor Financeiro
TPV é uma sigla, cujo significado é “Volume Total de Pagamentos”, que vem do inglês (Total Volume Payment).
TPV, ou Volume Total de Pagamentos, é uma métrica vital no setor financeiro, representando o montante total transacionado através dos meios de pagamento da empresa durante um período específico. Essa métrica oferece uma visão holística da saúde financeira do negócio, possibilitando avaliar o desempenho, tomar decisões estratégicas e projetar estimativas de faturamento.

## Utilização Estratégica do TPV
O TPV não deve ser interpretado de forma isolada. Ao contrário, é essencial conduzir análises comparativas, monitorando tendências ao longo do tempo e identificando padrões de crescimento ou declínio. Essa abordagem contínua fornece insights valiosos para orientar decisões estratégicas e ajustar metas comerciais conforme necessário.

``` SQL
SELECT 
    CONVERT(varchar, CAST(s.DataTransacao AS DATE), 103) as DataTransacao,
    REPLACE(SUM(si.MontanteBruto), '.', ',') as ValorBruto,
    COUNT(MontanteBruto) as 'N transacoes',
    REPLACE(SUM(si.MontanteLiquido), '.', ',') as ValorLiquido,
    REPLACE(SUM(si.MontanteAntecipado), '.', ',') as ValorAntecipado
FROM VendaParcela si
INNER JOIN Venda s ON si.IdVenda = s.IdVenda
WHERE si.StatusVendaId IN (22,5,11)
      AND CAST(s.DataTransacao AS DATE) BETWEEN '2024-04-01' AND '2024-04-30'
GROUP BY CAST(s.DataTransacao AS DATE)
ORDER BY CAST(s.DataTransacao AS DATE) ASC;

```

## Cláusulas utilizadas 
* SELECT
* FROM
* INNER JOIN
* WHERE
* GROUP BY
* SUM()
* COUNT()
* REPLACE()
* ORDER BY

## Explicação Detalhada
A Query de tpv mensal oferece uma análise detalhada das transações diárias de um estabelecimento comercial durante um mês específico. Utilizando funções de agregação, como SUM() e COUNT(), juntamente com a filtragem por status de transação e data, essa consulta fornece uma visão clara do desempenho financeiro diário, essencial para a tomada de decisões e análises financeiras. A formatação dos valores monetários e a organização dos dados por data facilitam a interpretação e a aplicação dos insights obtidos.

[<img src="https://avatars.githubusercontent.com/u/64026100?v=4" width=115> <br><sub>Leon Ortega</sub>](https://github.com/Leonkoc)

[Linkedin](https://www.linkedin.com/in/leon-ortega-cerqueira-frontend/)
