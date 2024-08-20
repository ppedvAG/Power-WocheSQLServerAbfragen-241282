--Umsatz pro
--Aggregate

--SUM(), AVG(), MIN(), MAX() COUNT()


select top 3 * from orders
select sum(freight), count(*), min(freight), max(freight), avg(freight), 
from orders

--Wieviele Kunden gibt es?

select count(*), count(customerid),
	count(region),
	count(isnull(region,'Y'))
from customers



select customerid , sum(freight) from orders
--where
group by customerid --alle Spalten des SELECT , aber AGG und Alias entfernen



--Wieviele Kunden gibt es pro Land?  Customers
--mit den meisten Kunden ganz nach oben

select
		country, count(*) Anzahl
from
		customers
group by 
		country
order by
	 Anzahl desc



--Umsatz pro Land
--Customers Country
--order details unitprice Quantity

select country, sum(unitprice*quantity)
from
	customers c inner join orders o  on c.CustomerID=o.CustomerID
				inner join [Order Details]od on od.OrderID=o.OrderID
group by 
		country


select country, sum(possumme) from vKundeumsatz
group by country

select * from orders
/*
welcher Ang (empId) hatte die höchsten Frachtkosten in Summe
und welcher hatte die neidrigsten in summe
*/

select top 1 employeeid , sum(freight) as Summe from orders
group by employeeid
order by Summe desc
UNION ALL
select top 1 employeeid , sum(freight) as Summe from orders
group by employeeid
order by Summe asc

--wie komm ich aus diesen Dilemma



--unterabfragen


select * from 
(select top 1 employeeid , sum(freight) as Summe from orders
group by employeeid
order by Summe desc) t1
UNION ALL
select * from 
(select top 1 employeeid , sum(freight) as Summe from orders
group by employeeid
order by Summe asc) t2








--#tabelle

select top 1 employeeid , sum(freight) as Summe 
into #t1
from orders
group by employeeid
order by Summe desc

insert into #t1
select top 1 employeeid , sum(freight) as Summe from orders
group by employeeid
order by Summe asc


select * from #t1





		
		

--die Länder mit mehr als 10 Kunden

select
		country, count(*) Anzahl
from
		customers
--where Anzahl > 10
group by 
		country having count(*) > 10--immer AGG ohne Alias
order by
	 Anzahl desc


AVG COUNT --NULL


2
4
isnull(NULL,0)
6
12:3 = 4
12:4 = 3



select country as Land, count(*) as Anzahl from customers
--where Anzahl > 10 --geht nicht
group by country HAVING count(*)  > 10

--   1 MIO DS
--FROM-->JOIN-->WHERE-->GROUP BY--> 
--> HAVING --> SELECT -->  ORDER BY --> TOP|DISTINCT-->Ausgabe


select country as Land, count(*) as Anzahl from customers
--where Anzahl > 10 --geht nicht
--WHERE COUNTRY LIKE 'U%'
group by country 
HAVING country like 'U%'


--Wir brauchen die Rechnungssummen pro Bestellung

--Orders: Orderid, Freight, RngSumme
--Order Details: unitprice quantity


SELECT o.OrderID, o.Freight,sum(od.unitprice*od.quantity) as rngSumme
FROM
	ORDERS o inner join [Order Details] od on o.OrderID=od.OrderID
GROUP BY 
	 o.OrderID, o.Freight



	 RngSumme pro BestNr und Fracht


10248  10 32232
10248  11


SELECT o.customerid, o.employeeid, sum(od.unitprice*od.quantity) as rngSumme
FROM
	ORDERS o inner join [Order Details] od on o.OrderID=od.OrderID
GROUP BY 
	 o.customerid, o.employeeid
	 order by 1 


select country,city, count(*) from customers
group by country, city

--Wieviele Kunden gibts pro Stadt
--oder pro Land
--oder Weltweit

select country,city, count(*) from customers
group by country, city order by 1,2

select country,city, count(*) from customers
group by country, city with rollup order by 1,2

select country,city, count(*) from customers
group by country, city with cube order by 1,2

--Was macht ROLLUP und was macht CUBE


--Select top Zahl

select top 10 * from orders --so wie die auf dert HDD rumliegen

select top 13 with ties orderid, freight, customerid
from orders order by freight

--die TOP 13 Kunden nach Fracht aufsteigend

select top 10 percent * from orders order by freight


