
dbcc freeproccache


select * from orders o inner join customers c on c.customerid = o.customerid
where orderid < 9 

select * from orders where orderid < 3 --tinyint
select * from orders where orderid < 30 --tinyint
select * from orders where orderid < 300 --smallint
select * from orders where orderid < 30000 --smallint
select * from orders where orderid < 300000 --int

creATE PROC GPDEMOXYd @PAR1 int
as
code


select * from customers where customerid = 'ALFKI'

select * from CustoMers where customerid = 'ALFKI'

select * from customers
	where Customerid = 'ALFKI'