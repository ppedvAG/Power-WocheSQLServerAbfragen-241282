USE NORTHWIND;
GO --Batchdelimiter


;WITH
CTE
as
(select companyname as			Firma from customers)
select * from cte


SELECT  
	CompanyName
	, CustomerID
--	,Country ---
	,city  
from Customers

Azure Data Studio

select --

/*
select top 3 * from customers
select top 3 * from orders

*/

select 
		Spalte1, Spalte2,
		* -- alle Spalten aller Tabellen aus dem From
		Spalte3 as X
		Zahlen, Txt
		Mathe, F()
		--alles was eine Spalte ausgibt
		(select top 1 companyname from customers)
		--darf nur eine Zeile und eine Spalte ausgeben
FROM
	TabelleA A  
	LEFT|RIGHT|INNER|CROSS|FULL
	JOIN TabelleB B  ON A.Sp1 = B.Sp2

	TABA a LEFT JOIN TABB b On a.id = b.id


	INNER JOIN 
	nur die Zeilen, die wo
	Werte in beiden Tabellen besitzten

	LEFT = + INNER JOIN  alle Werte von links
	RIGHT = INNER JOIN  + alle Werte von rechts
	FULL = + inner join +

select '100' as '200'
select '100' , '200'

select 100+200,
(select top 1 companyname from customers) from customers







--alle Kunden, die nichts gekauft haben
select * from customers
select * from orders



select 
	* 
	from 
		customers c Left Join Orders o ON c.CustomerID = o.CustomerID
Where 
		OrderID is NULL


select 	* 
	from 
		Orders o right Join customers c ON c.CustomerID = o.CustomerID
	Where 
		c.customerid is null


--Cross





--jeder mit jedem

select companyname, orderid from customers cross join orders


select 91*830


SELF  JOIN

select * from employees

Lastname  City Stv    City
KING      Lnd  Suyama Lnd
Suyama    Lnd  King   Lnd

select		e1.lastname, e1.city
		, e2.city, e2.lastname 
		from 
				   employees e1 
		inner join employees e2 on e1.city = e2.city
								--	and
								--e1.lastname != e2.lastname
		where
			e1.lastname != e2.lastname

select * from [order details]

order by 1

--alle aus  dem Jahr 1997
select * from orders


Select * from Orders
where 
	Datepart(Year, Orderdate) = '1997'

Select * from Orders
where 
	Datepart(yy, Orderdate) = '1997'

Select * from Orders
where 
	year(Orderdate) = '1997'
order by 4 desc

select * from Orders 
where 
	OrderDate between '1.1.1997 00:00:00.000' 
				and	  '31.12.1997 23:59:59.997'
order by 4 desc;

--datetime







