--COUNT

SELECT COUNT (*)
FROM Person.Person
/*
A função COUNT no SQL é usada para contar o número de linhas
 que atendem a uma determinada condição em uma tabela.
*/

--QUANTAS PESSOAS TEM UM TITULO DIFERENTE
SELECT COUNT (Title)
FROM Person.Person
--1009 títulos

-- SE EU QUISER SABER A QUANTIDADE DE TITULOS DIFERENTES
SELECT COUNT (DISTINCT Title)
FROM Person.Person
-- 6 TÍTULOS DIFERENTES

                                           --Desafios --
--Vou acessar a tabela inteira
SELECT *
FROM Production.Product

--Quantos produtos temos na nossa tabela produtos? production.product
SELECT COUNT (Distinct name)
FROM Production.Product
--504 produtos?
SELECT COUNT (ProductNumber)
FROM Production.Product
--504

-- Quantos tamanhos DIFERENTES de produtos temos cadastrados?
SELECT COUNT(SIZE)
FROM Production.Product
--211 TAMANHOS
--18 ÚNICOS