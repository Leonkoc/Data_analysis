# Query 1: Relatório de Transações por Comerciante

## Descrição Geral
  Esta query gera um relatório detalhado das transações, agrupando-as por data e identificador do comerciante. Especificamente, as transações são filtradas por status de interesse (como concluídas, pendentes, ou em disputa), fornecendo assim uma visão precisa da performance financeira diária do comerciante. Este filtro permite aos analistas focar em transações que são cruciais para a avaliação de liquidez e risco financeiro.
<hr>

## Estrutura da Query
A query é estruturada para agrupar os resultados por data da transação e identificador do comerciante (EC), ordenando os resultados pela data. Ela calcula somas e contagens para diferentes tipos de valores de transação, permitindo uma análise multifacetada do desempenho diário.
<hr>

``` SQL
SELECT 
    CONVERT(varchar, CAST(c.DataTransacao AS DATE), 103) as DataTransacao,
    c.IdentificadorComerciante as ECC,
    REPLACE(SUM(sy.MontanteBruto), '.', ',') as ValorBruto,
    COUNT(sy.MontanteBruto) as 'N transacoes',
    REPLACE(SUM(sy.MontanteLiquido), '.', ',') as ValorLiquido,
    REPLACE(SUM(sy.MontanteAntecipado), '.', ',') as ValorAntecipado
FROM VendaParcela sy
INNER JOIN VendasB2B c ON sy.IdVenda = cs.IdVenda
WHERE sy.StatusVendaId IN (1,4,22)
      AND CAST(c.DataTransacao AS DATE) BETWEEN '2019-01-01' AND GETDATE()
GROUP BY CAST(c.DataTransacao AS DATE), c.IdentificadorComerciante
ORDER BY CAST(c.DataTransacao AS DATE) ASC;

```
## Cláusulas SQL utilizadas
 * SELECT
 * FROM
 * INNER JOIN
 * WHERE 
 * GROUP BY
 * SUM()
 * COUNT()
 * REPLACE()
 * ORDER BY 
 * CONVERT()

<hr>

## Filtros Aplicados
* Status da Transação: As transações são filtradas para incluir apenas aquelas com status de interesse (como concluídas, pendentes ou em disputa), permitindo foco em movimentações financeiras relevantes para análises de liquidez e risco.
* Período da Transação: As transações são consideradas dentro do intervalo de '2019-01-01' até a data atual, permitindo uma análise contínua do desempenho do comerciante.

<hr>

## Considerações de Desempenho

* Índices: Certifique-se de que as colunas utilizadas nos filtros (StatusVendaId, DataTransacao) e nas cláusulas JOIN (IdVenda) estão indexadas para otimizar o desempenho.

* Volume de Dados: Para bancos de dados com grande volume de transações, considere executar esta query durante períodos de baixa atividade ou utilizar técnicas de particionamento de dados.

## Uso dos Resultados

Os resultados desta query são essenciais para análises financeiras diárias, ajudando a identificar tendências de vendas, avaliar a eficiência das políticas de antecipação de recebíveis, e monitorar a saúde financeira dos comerciantes. Os dados podem ser utilizados em relatórios gerenciais, dashboards de BI, e na preparação de material para revisões financeiras periódicas.

## Colaborador
[<img src="https://avatars.githubusercontent.com/u/64026100?v=4" width=115> <br><sub>Leon Ortega</sub>](https://github.com/Leonkoc)

[Linkedin](https://www.linkedin.com/in/leon-ortega-cerqueira-frontend/)