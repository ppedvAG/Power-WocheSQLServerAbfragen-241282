--Variablen
-- @ lokale Var
-- @@  globale Var

/*
lokal gilt nur in der Erstellersession
nur gültig solange der BATCH läuft


globale ist in allen Session erreichbar
Systemvariablen 

*/

declare @varname int
set @varname = 100
set @varname = @varname * 1000+3



declare @var1 int, --NULL
		@var2 int = 2
select  @var1+@var2, @var2

declare @var3 int
select @var3=count(*) from customers
select @var3

select @var3=count(*), country from customers--das darf man nicht


select @var from tabelle where sp = @var

--Wie groß ist der durchscnittliche Frachtkostenwert
--den weisen wir einer Var zu und geben die Var aus

declare @schnittFracht as money
select  @schnittFracht = avg(freight)*1.19 from orders
select 'Der durchschnittliche Lieferkostenbetrag liegt bei : ' 
		+ convert(varchar(50),  @schnittFracht)

select freight-@schnittfracht, freight  from orders
where freight > @schnittfracht



USE [Northwind]
GO

declare @land varchar(50) = 'UK',
		@fracht money = 10,
		@Produkt varchar(50) = 'Chai'



select	Companyname, c.customerid, c.country, c.city  --Customers
		,o.orderid, freight, o.employeeid			--Orders
		,od.productid, quantity, od.unitprice			--Order Details
		,Productname							--ProductName
		,Lastname, Firstname					--Employees
		,(od.quantity * od.unitprice) as PosSumme
FROM
		Customers c inner join orders o			  on c.CustomerID = o.CustomerID
					inner join [Order Details] od on od.OrderID   = o.OrderID
					inner join Products p		  on p.ProductID  = od.ProductID
					inner join employees e		  on e.employeeid = o.EmployeeID
where 
	c.Country = @land
	and
	freight < @fracht
	or
	Productname = @Produkt


GO

--Prozeduren @