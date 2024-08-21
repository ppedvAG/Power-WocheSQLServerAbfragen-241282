--Functions

--echt praktisch 

select fName(100,200) --> 10

select f(spalte), f(wert) from f(wert) where f(Spalte) > f(wert)

--f() sind furchtbar langsam



--Nirgends existiert die RSumme?

select sum(unitprice*quantity) from [Order Details] where orderid = 10248
GO

select * from orders where fRsumme(orderid) > ' 10000'
GO



--einfache F()   fBrutto

create function fBrutto(@netto money) returns money
as
begin
		return (select @netto *1.19)
end

select dbo.fBrutto(100)



select dbo.fBrutto(freight) as Brutto, freight  as netto from orders





select dbo.fRngSumme(orderid) --> 440


create function fRngSumme(@bestId int) returns money
as
BEGIN
		return
		(select sum(unitprice*quantity) from  [Order Details]
		where orderid = @bestid)

END

select dbo.fRngSumme(orderid) , 
		* from orders where dbo.fRngsumme(orderid) > 1000

select dbo.fRngSumme(10248)

--WHILE IF CASE




