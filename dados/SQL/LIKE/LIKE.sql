--LIKE
/*
	A cláusula LIKE no SQL é usada para buscar padrões em uma coluna de uma tabela.
	Ela permite que você encontre registros que contenham uma parte específica de texto em uma determinada coluna.
	WHERE FIRSTNAME LIKE 'LE%'
*/

SELECT *
FROM Person.Person
WHERE FirstName like 'le%'
--Exemplo de retorno Lee, Leo, Leslie...
SELECT *
FROM Person.Person
WHERE FirstName like '%ol'
--Exemplo de retorno Carol
SELECT *
FROM Person.Person
WHERE FirstName like '%ol%'
--Exemplo de retorno Caroline, nicOLe, cOLin, nicOLas, yOLanda...
SELECT *
FROM Person.Person
WHERE FirstName like '%ol_'
--Exemplo de retorno NichOLe, quando uso _ ele se limita a um caracter a mais depois do descrito