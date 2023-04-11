use [TSQL]
go


select city, count(1)
from sales.Customers
where contacttitle = 'owner'
group by city
order by 1 asc, 2 desc


select country, count(1)
from sales.Customers
where fax <> 'NULL'
group by country
order by postalcode asc




SELECT *
FROM Production.Products


select productid CodigoProducto, productname NombreProducto, categoryid CodigoCategoria, unitprice PrecioUnitario
from Production.Products
where productid between '60' and '70' 

select *
from sales.OrderDetails


select orderid CodigoOrden, productid CodigoProducto, unitprice PrecioUnitario, qty Cantidad,
		unitprice*qty-discount VentaTotal,
		case
			when unitprice*qty-discount >= 500 then 'ALTAS'
			when unitprice*qty-discount < 500 then 'BAJAS'
		end Categoria
from sales.OrderDetails


select *
into Orden
from sales.orders

select *
from Orden


select *
into OrdenDeta
from sales.orderDetails

select *
from OrdenDeta


select *
into Clientes
from sales.customers

select *
from Clientes


select *
from Production.Products


select *
into Categoria
from Production.categories



select *
into Proveedor
from Production.suppliers



select *
into Productos
from Production.Products

select *
from Orden



select *
from OrdenDeta


select *
from Clientes


select *
from Productos

select *
from Proveedor

select *
from Categoria



select C.custid IdCliente,  C.contactname NombreCliente, O.orderid OrderID, P.productname ProductoName,
		D.unitprice*qty-discount Venta, L.categoryname NombreCategoria, R.country Pais
from Orden O
	inner join Clientes C on C.custid = O.custid
	inner join OrdenDeta D on D.orderid = O.orderid
	inner join Productos P on P.productid = D.productid
	inner join Proveedor R on R.supplierid = P.supplierid
	inner join Categoria L on L.categoryid = P.categoryid

where C.custid >= 34 and D.unitprice*qty-discount >= 1000.00


select titleofcourtesy Title, firstname FirstName,
	case
		when Firstname <> 'NULL' then 'A'
	end MiddleName, lastname LastName
from HR.Employees

