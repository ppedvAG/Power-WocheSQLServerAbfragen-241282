--
IF Bedingung -- wahr oder falsch Tipp Abfrage in Klammern 
	or| AND 
   Bedingung
   BEGIN
	select | UP | DEL  | INS 
	select | UP | DEL  | INS 
   END
ELSE
	BEGIN --
		select 
		update
	END

IF 1=1 select 100


WHILE BEDINGUNG OR|AND Bedingung
	BEGIN
		--endlose Schleife
		--Debuggung mit SELECT PRINT
		--Bed wird zu Beginn überprüft
		IF .. BREAK
		CONTINUE -- geht zu Schleifeneinstieg und reslt wird nicht mehr ausgeführ
		restl CODE
	END


--CASE
	CASE
		when Beding(sp1) then Sp = wert --wie ein where in = <>  between like %  _  []
		when Beding(sp2) then Sp = wert
		ELSE sp = wert
	END


select freight,
		case
				when freight > 10 then 'A' --wird eine Beding erfüllt wird  der Rest nicht mehr angeschaut
				when freight > 100 then 'B'
				when freight > 500 then 'C'
				ELSE 'D'
		end
from Orders


select * from customers where companyname like '%t_'

select * from customers where companyname like '[ACEWU]%'

select * from customers where companyname like '[^A-E|B]%' --[0-9]

PIN not like  '[0-9|!@][0-9][0-9][0-9]'

between 1 and 9999   006

select * from customers where companyname like '%''%'


CREATE PROC PROCNAME @par1 int , @par2 int= defaultwert, @par3 int output
as
CODE


declare @var1 int
exec PROCNAME @par1= 10, @par3= @var1 output
select @var1


https://learn.microsoft.com/de-de/sql/t-sql/data-types/data-type-conversion-database-engine?view=sql-server-ver16

select * from customers where customerid = 'ALFKI' --nchar(5)

exec gpSucheKunden 'ALFKI' --1 

exec gpSucheKunden 'A' --4

exec gpSucheKunden '%' --alle 



create or alter proc gpSucheKunden @kdid varchar(5) ='%'
as
select * from customers where customerid like @kdid+'%'
--und weiterer irrsinniger langer Code :-)


CREATE FUNCTION fName (@par1 int, @par2 int) returns int -- table 
as
BEGIN
	CODE
END


--Suche alle Bestellungen aus dem Jahr 1997 (orders: Orderdate)

--Anzahl der Zeilen: 408 oder 411


select * from orders where orderdate between '1.1.1997' and '31.12.1997 23:59:59.997'

select * from orders where datepart (year, orderdate) = 1997

select * from orders where year(orderdate) = 1997

select * from orders where orderdate like '%1997%'


select * from customers where customerid like 'M%'

select * from customers where left(customerid,1) ='M'

--jeder ab 65  = Rente
select * from employees --alle ausgeben lassen, die heute in Rente sind


--Variante 1
select * from Employees where DATEDIFF(year,BirthDate,GETDATE()) > 65 ;
select * from employees where datediff(yy,birthdate , getdate()) >= 65
--Variante 2
select * from employees where dateadd(yy, 65,birthdate) <= Getdate()

--Variante 3
declare @Datum as datetime
select @datum = dateadd(yy,-65, getdate())--AVG (freight) asu UK
select @Datum

select * from employees where birthdate <= @Datum

--Variant 4
select * from employees where birthdate <= dateadd(yy,-65, getdate())

USE [master]
GO
ALTER DATABASE [Northwind] SET COMPATIBILITY_LEVEL = 160
GO

select * from orders where dbo.fRngSumme(Orderid) > 1000
set statistics io, time on


alter table orders 
add RngSumme as dbo.fRngSumme(orderid)

select * from orders where RngSumme > 1000



















































	select 100
	print 100