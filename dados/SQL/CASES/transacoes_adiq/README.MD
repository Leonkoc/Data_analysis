# Consulta: Transações por Adquirente
Esta consulta visa fornecer um resumo das transações processadas por cada adquirente em um determinado período de tempo.

## Visão Geral
A consulta extrai informações sobre transações processadas através do serviço, agrupando os resultados por adquirente e calculando o total de transações para cada um deles. Ela permite uma análise detalhada do volume de transações realizadas por cada adquirente dentro de um intervalo de datas específico.

## Cláusulas Utilizadas
SELECT: Seleciona os campos a serem exibidos na saída da consulta, incluindo o nome do adquirente e o total de transações.

* FROM: Especifica as tabelas utilizadas na consulta, incluindo a tabela de transações e a tabela de adquirentes.

* INNER JOIN: Combina as linhas das tabelas portalTransacoes e adiq com base no ID do adquirente para garantir que as transações sejam atribuídas ao adquirente correto.

* WHERE: Filtra as transações com base em critérios específicos, incluindo o status da transação e o intervalo de datas desejado.

* GROUP BY: Agrupa os resultados pelo nome do adquirente para calcular o total de transações para cada adquirente individualmente.

# Funcionamento
### Seleção dos Campos:
 A consulta seleciona o nome do adquirente e o total de transações processadas.

### Filtragem por Critérios: 
São filtradas apenas as transações com status específicos (por exemplo, "aprovada", "em andamento", etc.) e que ocorreram dentro do intervalo de datas desejado.

### Agrupamento por Adquirente:
 Os resultados são agrupados pelo nome do adquirente para calcular o total de transações para cada adquirente individualmente.

### Apresentação dos Resultados: 
Os resultados são apresentados como uma lista de adquirentes e seus respectivos totais de transações.

## Exemplo de Uso
Suponha que você queira analisar o volume de transações processadas por cada adquirente entre 12 de fevereiro de 2024 e 16 de março de 2024. Você pode executar a consulta conforme mostrado abaixo:

```SQL

SELECT 
    adiq.Name, 
    SUM(valort) as Total
FROM 
    portalTransacoes 
INNER JOIN 
    Adiq ON Aquire.adiqId = portalTransacoes .AcquireId
WHERE 
    portalTransacoes .GatewayStatusId IN (11, 3, 26, 77) 
    AND portalTransacoes.data  >= '2024-02-12' 
    AND portalTransacoes.data  <= '2024-03-16'
GROUP BY 
    adiq.Name;
```    
Este comando SQL retornará uma lista dos adquirentes envolvidos e o total de transações processadas por cada um deles dentro do período especificado.

Considerações
Certifique-se de substituir os valores das datas e quaisquer outros parâmetros conforme necessário para atender às suas necessidades específicas.