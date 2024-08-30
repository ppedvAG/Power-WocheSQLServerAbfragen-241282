select reportsto,* from employees

---wer ist der chef

Fuller 2        1
Davolio 1  2    2

Lastname , Lastname


select e1.employeeid, e1.lastname, e1.reportsto, 
		e2.employeeid, e2.lastname, e2.reportsto
from employees e1 inner join employees e2 on e1.reportsto = e2.EmployeeID


CTE

WITH CTENAME
as
(select * from employees)
select * from ctename


MAX(Freight) pro AngID

WITH CTE
as
(select employeeid, max(freight) as MaxFrcht from orders
group by employeeid)
select avg(maxfrcht) from cte



with cteang
as
(
--suche den Ankerpunkt
select employeeid , lastname, reportsto, 1 as ebene from employees where ReportsTo  is null
UNION ALL
select e.employeeid, e.lastname, e.reportsto, ebene+1 from Employees e 
	inner join cteang on e.reportsto = cteang.employeeid
)
select * from cteang where ebene = 3











