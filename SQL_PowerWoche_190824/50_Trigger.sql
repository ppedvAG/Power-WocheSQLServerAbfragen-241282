

--INS UP DEL  DML   CR AL DR DDL

create table testX
	(id int identity, Spx int, spy int);
GO

create or alter trigger trgDemo ON testx
FOR INSERT, UPDATE, DELETE
as
select * from testx
select * from inserted --UPDATE = INS UND DEL
select * from deleted;
GO


insert into testx 
select 10000,20000

--Füge eine Spalte ein in Orders Rsumme money

--Trigger, der die Rechnungs in Rsumme reinschreibt (order details)

alter table orders add Rsumme money


create trigger trgRsumme on [order details]
FOR INSERT, UPDATE , DELETE --AFTER  INSTEAD OF
as

update orders set rsumme = 
(select sum(unitprice*quantity) from  [Order Details] 
where orderid = (select top 1 orderid from inserted))
where orderid = (select top 1 orderid from inserted)


select  * from [Order Details]


begin tran

update [Order Details] set quantity = 1000 where orderid = 10248 and productid =11
--auch Änderung der RSumme in Orders
rollback



select 100, 200 , 300
       400, 500 , 600

