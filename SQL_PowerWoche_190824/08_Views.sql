--Sichten 

/*
Verhalten sich wie Tabellen
Können : SEL , INS, UP DEL und AUCH EIG rECHTE BESITZTEN!!

Sicht enthält immer nur eine Abfrage und gibt das akt Abfrageergebnis aus

Warum Sichten:
nicht schneller als adhoc Abfrage
Komfort weil Sicht auch nach Neustart wie eine Tabelle weiter verwednet werden kann
wg Security



*/

create view vName
as
select .....


select * from vSicht

insert into vSicht

Update vSicht

delete from vSicht

--Sicht: 
--Cust:  	Companyname, customerid, country, city
--Orders:   orderid, freight, employeeid
--Order details: productid, quantity, unitprice
--Products:      Productname, 
--Emaployees:    Lastname, Firstname

create or alter view vKundeUmsatz
as
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


select * from vKundeUmsatz where Possumme > 1000




