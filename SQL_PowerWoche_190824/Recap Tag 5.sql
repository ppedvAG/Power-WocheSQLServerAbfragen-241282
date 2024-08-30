/*







*/


select * into kuz from kux


select * from kuz where id = 117 --1


select * from kuz where country = 'UK' --50000


select * from kuz where freight < 10 --9


select * from kuz where City = 'london' and  employeeid = 1


_WA
IX_
--70%

---60%  40%
--90% RK  10% EV
--A 75%  AP 25%





--Erstellen bei INS 

--Aktualisierung: bei INS UP DEL , ab ca 20% +500+ Abfrage










set statistics io, time on
--Plan

select * from customers c 
	inner merge join orders o on 
						c.CustomerID=o.CustomerID


select * from customers c 
	inner loop join orders o on 
						c.CustomerID=o.CustomerID


select * from customers c 
	inner hash join orders o on 
						c.CustomerID=o.CustomerID




MERGE 

LOOP

HASH

ADAPTIVE JOIN



