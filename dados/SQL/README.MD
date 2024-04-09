<h1 align="center">Minhas consultas</h1>

# Em constante evolução 🌱

## Bem-vindo ao meu repositório de consultas SQL! Este é um espaço em constante transformação, criado inicialmente durante meus primeiros  estudos de SQL e continuamente atualizado à medida que aprendo e aplico novos conceitos. Aqui você encontrará uma coleção de consultas SQL e cláusulas para manipular e gerenciar bancos de dados.  Além disso, adiciono estudos de caso mais complexos na pasta [cases](./cases) para aprofundar o aprendizado.



## <h1 align="left">Cláusulas</h1>


## SELECT

 Seleciona dados de uma tabela ou exibe resultados de consultas.

 ## FROM

 Especifica a tabela da qual os dados serão selecionados.
<hr>

  ## WHERE
  Filtra os resultados da consulta com base em uma condição especificada.


## Aqui estou filtrando produtos com peso maior que 500 e menor que 700
``` SQL
SELECT *
FROM Production.Product
WHERE Weight >= 500 AND Weight <= 700
```
## Aqui eu tinha o id do meu cliente e queria saber o email com base no ID.
``` SQL
SELECT *
FROM Person.EmailAddress 
WHERE BusinessEntityID = 26
```
## Filtrando por nome e sobrenome
``` SQL
SELECT *
FROM Person.Person
WHERE LastName = 'Krebs' AND FirstName = 'Peter'
```
<hr>

 ## ORDER BY
   Usada para classificar os resultados em ordem crescente ou decrescente com base em uma ou mais colunas. Suponha que temos uma tabela chamada "clientes" com as seguintes colunas: "id_cliente", "nome_cliente", "email" e "data_cadastro". Queremos selecionar todos os clientes ordenados em ordem alfabética por nome. Podemos usar a cláusula ORDER BY para isso, da seguinte maneira:

  ``` SQL
SELECT *
 FROM clientes
  ORDER BY nome_cliente;
```
Isso irá retornar todos os registros da tabela "clientes", mas eles serão classificados em ordem alfabética
Posso usar o de maneira desc também
  ``` SQL
SELECT *
 FROM clientes
  ORDER BY nome_cliente DESC;
```
<hr>

  ## GROUP BY
  Filtra os resultados da consulta com base em uma condição especificada. 
  Suponha que temos a mesma tabela "clientes" com as seguintes colunas: "id_cliente", "nome_cliente", "email" e "data_cadastro". Queremos agrupar os clientes por data de cadastro para ver quantos clientes foram cadastrados em cada dia. Podemos usar a cláusula GROUP BY para isso, da seguinte maneira:

  ``` SQL
SELECT data_cadastro, COUNT(*)
 FROM clientes
  GROUP BY data_cadastro;
```
Isso irá retornar o número de clientes cadastrados em cada dia, agrupados pela coluna "data_cadastro". A função de agregação COUNT(*) é usada para contar o número de registros em cada grupo. Se quisermos renomear a coluna resultante para algo mais descritivo, podemos usar a palavra-chave "AS" e o 'apelido'

## Disclaimer
COUNT é uma função de agregação em SQL que retorna o número de linhas ou registros em uma determinada tabela ou conjunto de resultados. A função COUNT() pode ser usada com a cláusula SELECT para contar o número de linhas que correspondem a uma determinada condição.

 ``` SQL
-- Esse código está contando o número de registros na tabela "Product" que possuem um valor na coluna "SIZE".
SELECT COUNT(SIZE)
FROM Production.Product
--211 TAMANHOS
```

<hr>

 ## DISTINCT
Quando quero contar os valores únicos, ou seja eliminar os duplicados uso a cláusula DISTINCT em conjunto com a função COUNT();
 ``` SQL
SELECT COUNT(DISTINCT SIZE)
 FROM Production.Product;
```
Nesse caso abaixo retorna apenas os valores únicos da coluna "FirstName" da tabela "Person.Person
 ``` SQL
SELECT DISTINCT FirstName -- essa clausula remove resultados iguais.
FROM Person.Person
```
<hr>

 ## In
A cláusula "IN" é usada em SQL para especificar múltiplos valores em uma condição de consulta. Ela permite que você pesquise um conjunto de valores em uma coluna em vez de especificar um único valor, bastante útil para evitar o uso excessivo da clausula OR

 ``` SQL
  SELECT *
  FROM CUSTOMERS
  WHERE CITY IN ('NEW YORK', 'lOS ANGELES', 'CHICAGO', 'HOUSTON') 
-- ESSE CÓDIGO SELECIONA TODOS OS CLIENTES QUE ESTÃO LOCALIZADOS EM ALGUMA DESSAS CIDADES
```
Por exemplo, suponha que você queira selecionar todos os registros de uma tabela de funcionários que trabalham em departamentos específicos.

```` SQL
SELECT *
 FROM funcionarios
  WHERE departamento IN ('Vendas', 'Marketing', 'RH');
````
<hr>

## LIKE
A cláusula LIKE é usada em SQL para comparar uma coluna com um padrão de texto especificado. Ela é geralmente usada em conjunto com os caracteres curinga "%" e "_" para corresponder a um conjunto de valores de string que possuem um padrão comum.

+ Por exemplo, suponha que você queira selecionar todos os registros de uma tabela de clientes que têm um endereço de e-mail do Gmail.

````SQL
SELECT *
  FROM clientes
  WHERE email LIKE '%@gmail.com';
/*
Nesse exemplo, a cláusula "LIKE" é usada para buscar todas as strings que possuem o padrão "@gmail.com"
*/
````
<hr>

# Operadores
Em SQL, os operadores são símbolos especiais usados para realizar operações em valores e expressões.

## <> Diferente de
Por exemplo, suponha que temos uma tabela "clientes" com uma coluna "idade" e queremos selecionar todos os registros de clientes que não têm 25 anos.

````SQL
SELECT *
  FROM clientes
  WHERE idade <> 25;
--SELECIONE TODOS CLIENTES QUE NÃO TENHAM 25 ANOS 
````
<hr>

## Operadores Aritméticos
São usados para realizar operações matemáticas em valores numéricos.Os principais operadores aritméticos:
+  Adição +
+  Subtração -
+  Multiplicação *
+  Divisão /
+  Resto de divisão %


<hr>
<br><br>

# Operadores Lógicos
  São usados para combinar duas ou mais expressões booleanas e retornar um valor booleano. Os principais operadores lógicos são "AND", "OR" e "NOT".


# Operador AND

````SQL
SELECT *
FROM clientes
WHERE idade >= 18 AND cidade = 'São Paulo';
-- Este exemplo retorna todos os clientes com idade igual ou superior a 18 anos e que moram na cidade de São Paulo.
````
<hr>

# Operador OR
````SQL
SELECT *
FROM produtos
WHERE categoria = 'Eletrônicos' OR categoria = 'Informática';
-- Este exemplo retorna todos os produtos que pertencem à categoria de Eletrônicos ou Informática.
````
<hr>

# Operador NOT
````SQL
SELECT *
FROM pedidos
WHERE NOT status = 'Cancelado';
--Este exemplo retorna todos os pedidos que não estão cancelados. O operador "NOT" nega a expressão booleana que se segue
````
<hr>

# Operadores de Existência

## Cláusula EXISTS
````SQL
SELECT *
FROM clientes
WHERE EXISTS (SELECT 1 FROM pedidos WHERE clientes.id = pedidos.cliente_id);
````
Este exemplo retorna todos os clientes que têm pelo menos um pedido registrado na tabela "pedidos". A cláusula EXISTS verifica a existência de pelo menos um registro na tabela "pedidos" que corresponde ao cliente em questão.

## Cláusula NOT EXISTS
````SQL
SELECT *
 FROM clientes
WHERE NOT EXISTS (SELECT 1 FROM pedidos WHERE clientes.id = pedidos.cliente_id);
````
Este exemplo retorna todos os clientes que não têm nenhum pedido registrado na tabela "pedidos". A cláusula NOT EXISTS verifica a não existência de nenhum registro na tabela "pedidos" que corresponda ao cliente em questão.
<BR><BR>
# MIN MAXE AVG
As funções MIN, MAX e AVG são funções de agregação usadas em SQL para calcular valores estatísticos em colunas numéricas. Aqui estão alguns exemplos de como usar essas funções

## Função MIN
````SQL
SELECT MIN(preco) AS menor_preco
FROM produtos;
--Este exemplo retorna o menor valor da coluna "preco" da tabela "produtos"
````

## Função MAX
````SQL
SELECT MAX(preco) AS maior_preco 
FROM produtos;
--Este exemplo retorna o maior valor da coluna "preco" da tabela "produtos"
````

## Função AVG
````SQL
SELECT AVG(idade) AS media_idade 
FROM clientes;
-- Este exemplo retorna a média de valores da coluna "idade" da tabela "clientes"
````

# HAVING
A cláusula HAVING é usada em SQL para filtrar os resultados de uma consulta que utiliza a cláusula GROUP BY.
A cláusula HAVING é usada para especificar uma condição de filtro que deve ser aplicada aos grupos de dados agregados gerados pela cláusula GROUP BY.

````SQL
SELECT categoria, AVG(preco) AS media_preco
FROM produtos
GROUP BY categoria
HAVING AVG(preco) > 1000;
--Este exemplo retorna a média de preços para cada categoria de produtos e filtra apenas as categorias que têm uma média de preço acima de 1000.
````
# BETWEEN
`````SQL
SELECT *
FROM produtos
WHERE preco >= 50 AND preco <= 100 ALLOW FILTERING;
`````
[Post sobre](https://www.linkedin.com/posts/leon-ortega-cerqueira-frontend_sql-activity-7042565299535003648-J2TR?utm_source=share&utm_medium=member_desktop)



## <h1 align="left">Como colaborar com este projeto</h1>
Este projeto é aberto a contribuições da comunidade. Se você tiver sugestões para melhorar o projeto ou encontrar algum problema, fique à vontade para criar uma issue ou enviar um pull request.

Para enviar um pull request, siga as etapas abaixo:

+ Faça um fork deste repositório.

+ Clone o seu fork do repositório em sua máquina.

+ Faça as alterações que deseja no seu fork.

+ Faça um commit das suas alterações com uma mensagem clara e concisa.

+ Envie um pull request para este repositório, descrevendo as alterações que você fez e quaisquer informações adicionais relevantes.

<br><br>

<p align="center">Agradeço antecipadamente por sua contribuição!</p>

<h1 align="center">
   Meu Dicionário SQL <img alt="" src="https://img.shields.io/static/v1?label=->&message=2023&color=success&labelColor=grey"> <img alt="Stack Hacker" src="https://img.shields.io/static/v1?label=Tech&message=SQL&color=success&labelColor=grey">
</h1>
<h1 align="left">Analista</h1>

[<img src="https://avatars.githubusercontent.com/u/64026100?v=4" width=115> <br><sub>Leon Ortega</sub>](https://github.com/Leonkoc)

[Linkedin](https://www.linkedin.com/in/leon-ortega-cerqueira-frontend/)
