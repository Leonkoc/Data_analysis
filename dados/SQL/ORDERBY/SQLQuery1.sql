--Ordenar uma coluna de maneira descendente ou ascendente.
--Order by

SELECT EmailPromotion, FirstName
FROM Person.Person
ORDER BY EmailPromotion DESC ,FirstName ASC


/*
												DESAFIO
Obtenha o product id dos top 10 produtos mais caros do meu sistema , listando do mais barato ao mais dificil.
*/
SELECT TOP 10 ListPrice, ProductID
FROM Production.Product
ORDER BY ListPrice DESC

--DESAFIO 2: OBTER O NOME DO PRODUTO COM ID ENTRE 1-4
SELECT TOP 4 Name, ProductNumber
FROM Production.Product 
ORDER BY ProductID ASC