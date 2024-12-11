
# Documentação das Consultas SQL

Este documento descreve brevemente o propósito de cada consulta SQL, fórmulas utilizadas, métodos aplicados e explicações simples, mas profissionais.

---

## Consulta 1: Transações por Terminais com TPV e Representantes

**Objetivo:**  
Identificar o total de valor processado (TPV) por terminais de captura, agrupados por representantes e seus grupos. Inclui uma validação para transações ausentes.

**Detalhes Técnicos:**  
- `SUM(ISNULL(s.TransactionAmount, 0))`: Calcula o TPV, garantindo que valores nulos sejam tratados como zero.  
- `FORMAT`: Aplica formatação de valores no padrão brasileiro (pt-BR).  
- `GROUP BY`: Agrupa os dados por terminal, cliente, representante, e mês.  
- `LEFT JOIN`: Garante que todos os terminais sejam exibidos, mesmo sem transações associadas.

---

## Consulta 2: Resumo de Transações com Datas Ajustadas

**Objetivo:**  
Gerar um resumo de transações com datas formatadas para exibir apenas o componente de data, omitindo o horário.

**Detalhes Técnicos:**  
- `CAST(SaleDate AS DATE)`: Converte uma data completa (com horário) para exibir apenas a data.  
- Inclui informações básicas dos terminais.

---

## Consulta 3: Inclusão do Nome do Modelo e Tipo de Plataforma

**Objetivo:**  
Expandir a visão da consulta anterior para incluir os nomes do modelo do terminal e do tipo de plataforma. Útil para relatórios que exigem detalhamento técnico dos dispositivos.

**Detalhes Técnicos:**  
- `JOIN DeviceModels` e `JOIN Platforms`: Relacionam os IDs de modelo e plataforma para obter os nomes correspondentes.

---

## Consulta 4: Transações Agrupadas por Plataforma

**Objetivo:**  
Analisar transações por plataforma específica nos últimos 30 dias. Inclui métricas como valores brutos, líquidos e antecipados.

**Fórmulas Aplicadas:**  
- `SUM`: Soma total de valores por categoria.  
- `COUNT`: Conta o número total de transações.  
- `REPLACE`: Formata valores numéricos para o formato brasileiro com vírgula decimal.  

**Filtros:**  
- Transações com `StatusId IN (2, 5, 9)` (status válidos).  
- Intervalo de tempo definido pelos últimos 30 dias.  
- `PlatformTypeId` limita as plataformas analisadas.

---

## Consulta 5: Dados Completos da Tabela de Comerciantes

**Objetivo:**  
Criar um relatório detalhado sobre comerciantes, incluindo representantes, categorias, e detalhes de registro.

**Detalhes Técnicos:**  
- `LEFT JOIN`: Combina dados das tabelas de representantes e grupos, garantindo que comerciantes sem representantes ou grupos ainda sejam incluídos.  
- Campos personalizados com alias para melhor legibilidade nos relatórios (ex.: `CM.MerchantName AS Name`).

**Colunas Incluídas:**  
- Dados básicos como Nome, Endereço, Cidade, Estado e Tax ID.  
- Dados adicionais, como Representante e Grupo, obtidos via relacionamentos.

---

**Nota:** Todas as consultas foram ajustadas para seguir boas práticas de nomenclatura e legibilidade. Recomenda-se que sejam executadas em ambientes com índices otimizados para maximizar a performance.


</h1>
<h1 align="left">Analista</h1>

[<img src="https://avatars.githubusercontent.com/u/64026100?v=4" width=115> <br><sub>Leon Ortega</sub>](https://github.com/Leonkoc)

[Linkedin](https://www.linkedin.com/in/leon-ortega-cerqueira-frontend/)
