--Stored procedures
set statistics time on

select * from vKundeUmsatz


--beim ersten Aufruf
--Ausführungsplan wird fix hinterlegt (auch nach Neustart vorhanden)


--Prozedur kann was enthalten:
-->SEL, CREATE, INS, UP, DEL, Exec
---> vor allem viele Anweisungen

--ähnlich wie Windows batchDatei

--Proz werden nicht selected sondern ausgeführt

--sind auf dem SQL Server

exec ProcName

create or alter procedure gpdemo1
as
select 100
GO
exec gpdemo1


create or alter proc gpdemo2
as
select getdate()
GO
exec  gpdemo2



create proc gpdemo3 @par1 int, @par2 int
as
select @par1+@par2
GO

exec gpdemo3 10,3

exec gpdemo3 @par2=3 , @par1 = 2

exec gpdemo3 @par2 = 10, @par1 = 0



--gpBestnachFracht 10

--alle Bestellung über diesen Wert

create or alter proc gpBestnachFracht-- @kostengrenze money
as
declare @schnitt as money
select @schnitt =  avg(freight) from orders

select 
	freight
	, @schnitt
	, @schnitt - freight
from orders where freight  > @schnitt


exec gpBestnachFracht



exec gpBestnachFracht 78




--Kann man Variablen der Proz bzw auch das Ergebis weiterrreichen



create or alter proc gpdemo4 
	@par1 int, @par2 int, @par3 int output --ikst auch Input
AS
SELECT @par3= @par1+@par2
select @par3


declare @varx as int=0
exec gpdemo4 @par1=111,@par2=13, @par3=@varx --output

select * from orders where freight > @varx


select * from orders whgre freight > 15

select * into od from  [Order Details]
select * into o from orders
select * into c from customers


delete from customers where customerid = 'ALFKI'
--um den Kunden zu läöschen, müssen zuerst 
--alle orderdetails des Kunden weg
--dann alle orders des Kunden
--und dann den Kunden


begin tran
exec gpDelKunde 'ALFKI' --customerid
--kontrolle
rollback

create or alter proc gpDelKunde @KdId char(5), @wirklich int = 0
as
IF @wirklich = 0
BEGIN 
	select * from OD
		where orderid in (select orderid from O where customerid = @KdId)
	select * from O where customerid = @KdId
	select * from C where customerid = @KdId
END
IF @wirklich = 1
BEGIN
	delete from OD
	where orderid in (select orderid from O where customerid = @KdId)
	Delete from O where customerid = @KdId
	delete from C where customerid = @KdId
END
IF @wirklich > 1 select  'hey gib ne 1 oder ne 0 ein'

select * from OD
	where orderid in (select orderid from O where customerid = @KdId)
select * from O where customerid = @KdId
select * from C where customerid = @KdId
GO

set statistics time off
begin tran
exec gpDelKunde 'BLAUS',2
select * from c
rollback















select * from sys.procedures





