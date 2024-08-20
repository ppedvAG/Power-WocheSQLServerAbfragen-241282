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