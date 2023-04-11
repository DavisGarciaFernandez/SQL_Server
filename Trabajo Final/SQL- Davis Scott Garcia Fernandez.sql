--PREGUNTA N°1

use [TSQL]
go

SELECT año_orden, COUNT(DISTINCT Cod_Cliente) AS cant_clientes
FROM (
 SELECT YEAR(orderdate) AS año_orden ,custid AS Cod_Cliente
 FROM Sales.Orders) AS tablita
GROUP BY año_orden
HAVING COUNT(DISTINCT Cod_Cliente) > 70



with TablaCTE as (
SELECT YEAR(orderdate) año_orden ,custid Cod_Cliente
FROM Sales.Orders) 

SELECT año_orden, COUNT(DISTINCT Cod_Cliente) AS cant_clientes
FROM TablaCTE
GROUP BY año_orden
HAVING COUNT(DISTINCT Cod_Cliente) > 70


--------------------------------------------------------------------------------------------------------------------------------
--PREGUNTA N°2


use [AdventureWorks]
go

select *
from Sales.salesPerson


select count(1)
from Sales.salesPerson


--------------------------------------------------------------------------------------------------------------------------------
--PREGUNTA N°3


use [TSQL]
go

CLAVE D

select custid
from Sales.Customers
where country = 'Mexico'


select custid
from Sales.Customers
where country in ('Mexico')



--------------------------------------------------------------------------------------------------------------------------------
--PREGUNTA N°4


CLAVE B

select distinct TOP 5 productid, sum(unitprice)
from Sales.OrderDetails
order by unitprice desc


select TOP 5 productid, sum(unitprice)
from Sales.OrderDetails
group by productid
order by sum(unitprice)


select TOP 5 productid, unitprice
from Sales.OrderDetails
group by productid


select distinct TOP 5 productid, unitprice
from Sales.OrderDetails
order by unitprice asc


--------------------------------------------------------------------------------------------------------------------------------
--PREGUNTA N°5


use [AdventureWorks]
go

create table Persona(
		PrimerNombre varchar(100),
		Apellido varchar(100) 
)

insert into Persona(PrimerNombre, Apellido)
select Firstname PrimerNombre, 'Pedro' Apellido
from Person.Person

select *
from Persona



--------------------------------------------------------------------------------------------------------------------------------
--PREGUNTA N°6


select P.LastName Apellido 
from HumanResources.Employee E
inner join Person.Person P on E.BusinessEntityID = P.BusinessEntityID
where P.LastName like '%S%'


--------------------------------------------------------------------------------------------------------------------------------
--PREGUNTA N°7


select H.DepartmentID, D.Name, D.GroupName
from HumanResources.Employee E
    inner join HumanResources.EmployeeDepartmentHistory H on E.BusinessEntityID = H.BusinessEntityID
    inner join HumanResources.Department D on D.DepartmentID = H.DepartmentID
where D.Name = 'Production' and D.GroupName = 'Quality Assurance'



--------------------------------------------------------------------------------------------------------------------------------
--PREGUNTA N°8

SELECT ED.DepartmentID, count(shiftID) CantidadEmpleados
FROM HumanResources.Department D
inner join HumanResources.EmployeeDepartmentHistory ED on ED.DepartmentID = D.DepartmentID
GROUP BY ED.DepartmentID



--------------------------------------------------------------------------------------------------------------------------------
--PREGUNTA N°9

SELECT P.FirstName Nombre, P.LastName Apellido, E.Gender,  E.BirthDate, 
(DATEDIFF(yy,E.BirthDate,GETDATE()) ) EDAD
FROM HumanResources.Employee E
INNER JOIN Person.Person P ON P.businessEntityID = E.businessEntityID
WHERE (DATEDIFF(yy,E.BirthDate,GETDATE()) ) > 40


--------------------------------------------------------------------------------------------------------------------------------
--PREGUNTA N°10


SELECT E.Gender, count(NameStyle) SumaCantidad
FROM HumanResources.Employee E 
    inner join Person.Person P on P.businessEntityID = E.businessEntityID 
GROUP BY E.Gender