--WHERE CONDIÇÃO
SELECT *
FROM Person.Person
WHERE LastName = 'Miller' AND FirstName = 'anna'


SELECT *
FROM Production.Product
WHERE color = 'black' or color = 'red'

SELECT *
FROM Production.Product
WHERE ListPrice > 1500 AND ListPrice < 2000

SELECT *
FROM Production.Product
WHERE color <> 'black'

/*
DESAFIO
	CHEFE PEDIU O NOME DE TODAS AS PEÇAS QUE PESAM MAIS QUE 500KG MAS NÃO MAIS QUE 700;
*/

SELECT *
FROM Production.Product
WHERE Weight >= 500 AND Weight <= 700

/*
	Marital status = estado civil
	RELAÇÃO DE TODOS OS EMPREGADOS(EMPLOYEES) QUE SÃO CASADOS (SINGLE = SOLTEIRO, MARRIED = CASADO) E SÃO ASALARIADOS(SALARIED)
*/
SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'm' and SalariedFlag = 0