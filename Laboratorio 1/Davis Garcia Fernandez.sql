USE AdventureWorks

SELECT *
FROM Person.Person

-------------------------------------

SELECT title Titulo, FirstName PrimerNombre, MiddleName SegundoNombre, LastName Apellido
FROM Person.Person

-------------------------------------

SELECT *
FROM Person.Person
WHERE FirstName like 'A%' and PersonType != 'IN' 

-------------------------------------

SELECT DISTINCT FirstName
FROM Person.Person

-------------------------------------

SELECT 
	BusinessEntityID, PersonType, NameStyle, Title, FirstName, MiddleName, LastName, Suffix, EmailPromotion, AdditionalContactInfo, Demographics, rowguid, ModifiedDate,
	CASE
		WHEN EmailPromotion = 0 THEN 'No'
		ELSE 'Si'
	END EmailLogic
FROM Person.Person