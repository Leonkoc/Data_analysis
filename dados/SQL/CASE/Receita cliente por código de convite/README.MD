# Análise de Transações de Clientes por Código de Convite
# Introdução
Este projeto visa analisar as transações de clientes com base em códigos de convite específicos. A análise é realizada em um banco de dados que registra transações financeiras de uma empresa, permitindo insights sobre a eficácia de diferentes estratégias de marketing por meio de códigos de convite.

# Contexto do Negócio
A empresa em questão utiliza códigos de convite para atrair novos clientes e incentivar transações. Cada cliente pode utilizar um código de convite específico ao se cadastrar, e as transações associadas a esses códigos são registradas no banco de dados. O objetivo é analisar o desempenho de diferentes códigos de convite em termos de receita gerada e número de transações.

# Objetivo
O objetivo principal desta análise é fornecer insights sobre o desempenho das estratégias de marketing associadas aos códigos de convite. Para isso, a análise se concentrará em:

* Total de receita gerada por cada código de convite.
* Número de transações realizadas por cada código de convite.
* Identificação dos produtos mais populares entre os clientes que utilizam códigos de convite específicos.
Consulta SQL
A consulta SQL utilizada para realizar essa análise é a seguinte:

## Explicação da Consulta

1. **Seleção de Colunas:**

A consulta seleciona várias colunas relevantes para a análise, incluindo identificadores de conta, nome do cliente, total de receita, taxa, número de transações, nome do produto, código de convite e datas das transações.

2. **Joins:**

A consulta realiza joins entre três tabelas: TransactionRecords, CustomerData e ProductData. Esses joins são realizados com base em chaves primárias e estrangeiras para vincular transações a clientes e produtos.

3. **Filtragem de Dados:**

Os dados são filtrados com base em datas de transação específicas ('2023-02-01' a '2023-03-15'), excluindo uma categoria específica de transações (categoria_id <> 35) e selecionando apenas os códigos de convite relevantes.

4. **Agregação de Dados:**

Os dados são agregados usando funções de agregação como SUM e COUNT, agrupados por cliente, conta, código de convite, nome do produto e datas de transação.

5. **Ordenação:**
Os resultados são ordenados por ano e mês das transações.

## Resultados Esperados
Ao executar esta consulta, esperamos obter uma tabela de resultados que forneça insights sobre o desempenho de diferentes códigos de convite em termos de receita gerada, número de transações e produtos mais populares entre os clientes que utilizam esses códigos de convite.

<h1 align="left">Analista</h1>

[<img src="https://avatars.githubusercontent.com/u/64026100?v=4" width=115> <br><sub>Leon Ortega</sub>](https://github.com/Leonkoc)

[Linkedin](https://www.linkedin.com/in/leon-ortega-cerqueira-frontend/)
